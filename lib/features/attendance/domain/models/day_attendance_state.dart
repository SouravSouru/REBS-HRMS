import 'attendance_event.dart';
import 'attendance_record.dart';

enum TodayStatus { notCheckedIn, checkedIn, checkedOut }

class DayAttendanceState {
  const DayAttendanceState({
    required this.companyDate,
    required this.status,
    this.checkInAt,
    this.checkOutAt,
    this.syncBadge,
    this.rejectReason,
  });

  final String companyDate;
  final TodayStatus status;
  final DateTime? checkInAt;
  final DateTime? checkOutAt;
  final SyncBadge? syncBadge;
  final String? rejectReason;

  factory DayAttendanceState.fromCacheAndOutbox({
    required String companyDate,
    AttendanceRecord? cached,
    required List<OutboxEntry> outboxForDay,
  }) {
    final active = outboxForDay
        .where((e) => e.status != SyncBadge.rejected)
        .toList();

    DateTime? checkIn = cached?.checkInAt;
    DateTime? checkOut = cached?.checkOutAt;
    SyncBadge? badge;
    String? rejectReason;

    for (final entry in active) {
      if (entry.type == AttendanceEventType.checkIn) {
        checkIn ??= entry.occurredAt;
        badge = _worseBadge(badge, entry.status);
      } else if (entry.type == AttendanceEventType.checkOut) {
        checkOut ??= entry.occurredAt;
        badge = _worseBadge(badge, entry.status);
      }
    }

    final rejected = outboxForDay
        .where((e) => e.status == SyncBadge.rejected)
        .toList();
    if (rejected.isNotEmpty && checkIn == null && checkOut == null) {
      badge = SyncBadge.rejected;
      rejectReason = rejected.last.rejectReason;
    }

    final TodayStatus status;
    if (checkOut != null) {
      status = TodayStatus.checkedOut;
    } else if (checkIn != null) {
      status = TodayStatus.checkedIn;
    } else {
      status = TodayStatus.notCheckedIn;
    }

    return DayAttendanceState(
      companyDate: companyDate,
      status: status,
      checkInAt: checkIn,
      checkOutAt: checkOut,
      syncBadge: badge,
      rejectReason: rejectReason,
    );
  }

  static SyncBadge _worseBadge(SyncBadge? current, SyncBadge next) {
    if (current == null) return next;
    if (current == SyncBadge.rejected || next == SyncBadge.rejected) {
      return SyncBadge.rejected;
    }
    if (current == SyncBadge.pending || next == SyncBadge.pending) {
      return SyncBadge.pending;
    }
    return SyncBadge.synced;
  }
}
