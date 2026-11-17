import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/error/app_exception.dart';
import '../../../core/providers/core_providers.dart';
import '../../sync/presentation/sync_providers.dart';
import '../domain/models/attendance_event.dart';
import '../domain/models/employee.dart';
import '../domain/rules/attendance_rules.dart';
import 'providers/attendance_providers.dart';

part 'attendance_action_notifier.g.dart';

@riverpod
class AttendanceActionNotifier extends _$AttendanceActionNotifier {
  static const _uuid = Uuid();
  static const _rules = AttendanceRules();

  bool _inFlight = false;

  @override
  AttendanceActionState build() => const AttendanceActionState();

  Future<void> checkIn() => _run(AttendanceEventType.checkIn);

  Future<void> checkOut() => _run(AttendanceEventType.checkOut);

  Future<void> _run(AttendanceEventType type) async {
    if (_inFlight) return;
    _inFlight = true;
    state = const AttendanceActionState(isBusy: true);

    try {
      final repo = ref.read(attendanceRepositoryProvider);
      final employee = await repo.getEmployee();
      if (employee == null) {
        throw const AttendanceRuleException(
          'Employee profile is not loaded yet. Pull to refresh.',
        );
      }

      await _enqueue(type: type, employee: employee);
      state = const AttendanceActionState();

      final online = await ref.read(connectivityServiceProvider).isOnline;
      if (online) {
        await ref.read(syncControllerProvider.notifier).syncNow(force: true);
      }
    } on LocationException catch (e) {
      state = AttendanceActionState(
        errorMessage: e.message,
        locationFailure: e.kind,
      );
    } on AppException catch (e) {
      state = AttendanceActionState(errorMessage: e.message);
    } catch (_) {
      state = const AttendanceActionState(
        errorMessage: 'Something went wrong. Please try again.',
      );
    } finally {
      _inFlight = false;
    }
  }

  Future<void> _enqueue({
    required AttendanceEventType type,
    required Employee employee,
  }) async {
    final repo = ref.read(attendanceRepositoryProvider);
    final clock = ref.read(companyClockProvider);
    final companyDate = clock.todayCompanyDate();
    final cached = await repo.getToday(companyDate);
    final outbox = await repo.getOutboxForDate(companyDate);

    if (type == AttendanceEventType.checkIn) {
      _rules.validateCheckIn(cached: cached, outboxForDay: outbox);
    } else {
      _rules.validateCheckOut(cached: cached, outboxForDay: outbox);
    }

    final point = await ref.read(locationServiceProvider).currentPosition();
    final distance = _rules.distanceFromOffice(
      latitude: point.latitude,
      longitude: point.longitude,
      officeLat: employee.officeLat,
      officeLng: employee.officeLng,
    );
    _rules.validateWithinRadius(
      latitude: point.latitude,
      longitude: point.longitude,
      officeLat: employee.officeLat,
      officeLng: employee.officeLng,
      radiusMeters: employee.radiusMeters,
    );

    await repo.enqueueEvent(
      AttendanceEvent(
        eventId: _uuid.v4(),
        type: type,
        companyDate: companyDate,
        occurredAt: clock.nowUtc(),
        latitude: point.latitude,
        longitude: point.longitude,
        distanceFromOfficeMeters: distance,
      ),
    );
  }
}

class AttendanceActionState {
  const AttendanceActionState({
    this.isBusy = false,
    this.errorMessage,
    this.locationFailure,
  });

  final bool isBusy;
  final String? errorMessage;
  final LocationFailureKind? locationFailure;
}
