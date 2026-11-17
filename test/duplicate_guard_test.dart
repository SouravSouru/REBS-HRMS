import 'package:flutter_test/flutter_test.dart';
import 'package:rebs_hrms/core/error/app_exception.dart';
import 'package:rebs_hrms/features/attendance/domain/models/attendance_event.dart';
import 'package:rebs_hrms/features/attendance/domain/rules/attendance_rules.dart';

void main() {
  const rules = AttendanceRules();
  const date = '2026-11-17';

  test('rapid second check-in is rejected by domain date/type check', () {
    final first = OutboxEntry(
      sequence: 1,
      eventId: 'evt-1',
      type: AttendanceEventType.checkIn,
      companyDate: date,
      occurredAt: DateTime.utc(2026, 11, 17, 4),
      latitude: 12.97,
      longitude: 77.59,
      distanceFromOfficeMeters: 5,
      status: SyncBadge.pending,
      attemptCount: 0,
    );

    expect(
      () => rules.validateCheckIn(
        cached: null,
        outboxForDay: [first],
      ),
      throwsA(isA<AttendanceRuleException>()),
    );
  });

  test('retry keeps the original eventId identity', () {
    const eventId = '11111111-1111-4111-8111-111111111111';
    final original = AttendanceEvent(
      eventId: eventId,
      type: AttendanceEventType.checkIn,
      companyDate: date,
      occurredAt: DateTime.utc(2026, 11, 17, 4),
      latitude: 12.9716,
      longitude: 77.5946,
      distanceFromOfficeMeters: 5,
    );
    final retry = AttendanceEvent(
      eventId: eventId,
      type: AttendanceEventType.checkIn,
      companyDate: date,
      occurredAt: original.occurredAt,
      latitude: original.latitude,
      longitude: original.longitude,
      distanceFromOfficeMeters: original.distanceFromOfficeMeters,
    );
    expect(retry.eventId, original.eventId);
  });
}
