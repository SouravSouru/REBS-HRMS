import '../../../../core/error/app_exception.dart';
import '../../../../core/time/company_clock.dart';
import '../../attendance/data/attendance_repository.dart';
import '../../attendance/domain/models/attendance_event.dart';
import '../../attendance/domain/rules/attendance_rules.dart';

enum SyncStopReason { none, retryableFailure, empty }

class SyncRunResult {
  const SyncRunResult({
    required this.syncedCount,
    required this.rejectedCount,
    required this.stopReason,
  });

  final int syncedCount;
  final int rejectedCount;
  final SyncStopReason stopReason;
}

typedef PostAttendanceEvent =
    Future<({String serverRecordId})> Function(AttendanceEvent event);

class SyncEngine {
  SyncEngine({
    required this.attendanceRepository,
    required this.postEvent,
    required this.clock,
    this.rules = const AttendanceRules(),
    this.maxBackoff = const Duration(seconds: 60),
  });

  final AttendanceRepository attendanceRepository;
  final PostAttendanceEvent postEvent;
  final CompanyClock clock;
  final AttendanceRules rules;
  final Duration maxBackoff;

  bool _running = false;
  DateTime? _nextAutomaticRetryAt;

  Duration backoffFor(int attemptCount) {
    final seconds = (2 << (attemptCount.clamp(0, 5))).clamp(
      2,
      maxBackoff.inSeconds,
    );
    return Duration(seconds: seconds);
  }

  Future<SyncRunResult> sync({bool force = false}) async {
    if (_running) {
      return const SyncRunResult(
        syncedCount: 0,
        rejectedCount: 0,
        stopReason: SyncStopReason.empty,
      );
    }

    if (!force &&
        _nextAutomaticRetryAt != null &&
        clock.nowUtc().isBefore(_nextAutomaticRetryAt!)) {
      return const SyncRunResult(
        syncedCount: 0,
        rejectedCount: 0,
        stopReason: SyncStopReason.empty,
      );
    }

    _running = true;
    var synced = 0;
    var rejected = 0;
    var stopReason = SyncStopReason.empty;

    try {
      final pending = await attendanceRepository.getPendingOutbox();
      if (pending.isEmpty) {
        _nextAutomaticRetryAt = null;
        return const SyncRunResult(
          syncedCount: 0,
          rejectedCount: 0,
          stopReason: SyncStopReason.empty,
        );
      }

      for (final entry in pending) {
        final dayOutbox = await attendanceRepository.getOutboxForDate(
          entry.companyDate,
        );
        final cached = await attendanceRepository.getToday(entry.companyDate);

        if (rules.dependsOnRejectedCheckIn(
          type: entry.type,
          outboxForDay: dayOutbox,
          cached: cached,
        )) {
          await attendanceRepository.markRejected(
            sequence: entry.sequence,
            reason: 'Depends on a rejected check-in',
          );
          rejected++;
          continue;
        }

        try {
          final response = await postEvent(eventFromOutbox(entry));
          await attendanceRepository.markSynced(
            sequence: entry.sequence,
            serverRecordId: response.serverRecordId,
          );
          synced++;
        } on ServerException catch (e) {
          final status = e.statusCode;
          if (status == 409 ||
              (status != null && status >= 400 && status < 500)) {
            await attendanceRepository.markRejected(
              sequence: entry.sequence,
              reason: e.message,
            );
            rejected++;
            continue;
          }
          await attendanceRepository.markAttempt(
            sequence: entry.sequence,
            attemptCount: entry.attemptCount + 1,
            attemptedAt: clock.nowUtc(),
          );
          _nextAutomaticRetryAt = clock.nowUtc().add(
            backoffFor(entry.attemptCount + 1),
          );
          stopReason = SyncStopReason.retryableFailure;
          break;
        } on NetworkException {
          await attendanceRepository.markAttempt(
            sequence: entry.sequence,
            attemptCount: entry.attemptCount + 1,
            attemptedAt: clock.nowUtc(),
          );
          _nextAutomaticRetryAt = clock.nowUtc().add(
            backoffFor(entry.attemptCount + 1),
          );
          stopReason = SyncStopReason.retryableFailure;
          break;
        }
      }

      if (stopReason != SyncStopReason.retryableFailure) {
        _nextAutomaticRetryAt = null;
        stopReason = SyncStopReason.none;
      }
    } finally {
      _running = false;
    }

    return SyncRunResult(
      syncedCount: synced,
      rejectedCount: rejected,
      stopReason: stopReason,
    );
  }
}
