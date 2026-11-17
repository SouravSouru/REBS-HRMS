import 'package:flutter_test/flutter_test.dart';
import 'package:rebs_hrms/core/error/app_exception.dart';
import 'package:rebs_hrms/features/attendance/domain/models/attendance_event.dart';
import 'package:rebs_hrms/features/attendance/domain/models/attendance_record.dart';
import 'package:rebs_hrms/features/attendance/domain/rules/attendance_rules.dart';

void main() {
  const rules = AttendanceRules();
  const date = '2026-11-17';

  OutboxEntry pendingCheckIn() => OutboxEntry(
    sequence: 1,
    eventId: 'e1',
    type: AttendanceEventType.checkIn,
    companyDate: date,
    occurredAt: DateTime.utc(2026, 11, 17, 4),
    latitude: 12.97,
    longitude: 77.59,
    distanceFromOfficeMeters: 10,
    status: SyncBadge.pending,
    attemptCount: 0,
  );

  test('check-out without check-in is rejected', () {
    expect(
      () => rules.validateCheckOut(
        cached: null,
        outboxForDay: const [],
      ),
      throwsA(isA<AttendanceRuleException>()),
    );
  });

  test('check-out is allowed after pending check-in', () {
    expect(
      () => rules.validateCheckOut(
        cached: null,
        outboxForDay: [pendingCheckIn()],
      ),
      returnsNormally,
    );
  });

  test('second check-in is rejected when pending check-in exists', () {
    expect(
      () => rules.validateCheckIn(
        cached: null,
        outboxForDay: [pendingCheckIn()],
      ),
      throwsA(isA<AttendanceRuleException>()),
    );
  });

  test('rejected check-in does not count as effective check-in', () {
    final rejected = OutboxEntry(
      sequence: 1,
      eventId: 'e1',
      type: AttendanceEventType.checkIn,
      companyDate: date,
      occurredAt: DateTime.utc(2026, 11, 17, 4),
      latitude: 12.97,
      longitude: 77.59,
      distanceFromOfficeMeters: 10,
      status: SyncBadge.rejected,
      attemptCount: 1,
      rejectReason: 'Attendance already exists for this day.',
    );
    expect(
      rules.hasEffectiveCheckIn(cached: null, outboxForDay: [rejected]),
      isFalse,
    );
  });

  test('distance outside radius includes metres in message', () {
    expect(
      () => rules.validateWithinRadius(
        latitude: 12.9716 + 0.01,
        longitude: 77.5946,
        officeLat: 12.9716,
        officeLng: 77.5946,
        radiusMeters: 200,
      ),
      throwsA(
        isA<AttendanceRuleException>().having(
          (e) => e.message,
          'message',
          contains('away from the office'),
        ),
      ),
    );
  });

  test('cached check-in blocks another check-in', () {
    expect(
      () => rules.validateCheckIn(
        cached: AttendanceRecord(
          companyDate: date,
          checkInAt: DateTime.utc(2026, 11, 17, 3),
        ),
        outboxForDay: const [],
      ),
      throwsA(isA<AttendanceRuleException>()),
    );
  });
}
