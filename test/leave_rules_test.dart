import 'package:flutter_test/flutter_test.dart';
import 'package:rebs_hrms/core/error/app_exception.dart';
import 'package:rebs_hrms/features/leave/domain/models/leave_models.dart';
import 'package:rebs_hrms/features/leave/domain/rules/leave_rules.dart';

void main() {
  const rules = LeaveRules();
  const balance = LeaveBalance(casual: 5, sick: 3);
  const today = '2026-11-17';

  LeaveDraft draft({
    LeaveType type = LeaveType.casual,
    String start = '2026-11-18',
    String end = '2026-11-19',
    String reason = 'Family function travel plans',
  }) {
    return LeaveDraft(
      type: type,
      startDate: start,
      endDate: end,
      reason: reason,
    );
  }

  test('rejects start date before company today', () {
    expect(
      () => rules.validate(
        draft: draft(start: '2026-11-16', end: '2026-11-16'),
        companyToday: today,
        balance: balance,
        existing: const [],
      ),
      throwsA(isA<LeaveRuleException>()),
    );
  });

  test('rejects end before start', () {
    expect(
      () => rules.validate(
        draft: draft(start: '2026-11-20', end: '2026-11-18'),
        companyToday: today,
        balance: balance,
        existing: const [],
      ),
      throwsA(isA<LeaveRuleException>()),
    );
  });

  test('rejects short reason after trimming whitespace', () {
    expect(
      () => rules.validate(
        draft: draft(reason: '   short   '),
        companyToday: today,
        balance: balance,
        existing: const [],
      ),
      throwsA(isA<LeaveRuleException>()),
    );
  });

  test('rejects when requested days exceed balance', () {
    expect(
      () => rules.validate(
        draft: draft(start: '2026-11-18', end: '2026-11-30'),
        companyToday: today,
        balance: balance,
        existing: const [],
      ),
      throwsA(isA<LeaveRuleException>()),
    );
  });

  test('rejects overlapping pending or approved leave', () {
    final existing = [
      LeaveRequest(
        id: '1',
        type: LeaveType.casual,
        startDate: '2026-11-18',
        endDate: '2026-11-19',
        reason: 'Already booked trip away',
        status: LeaveStatus.pending,
        days: 2,
      ),
    ];
    expect(
      () => rules.validate(
        draft: draft(),
        companyToday: today,
        balance: balance,
        existing: existing,
      ),
      throwsA(
        isA<LeaveRuleException>().having(
          (e) => e.message,
          'message',
          contains('overlaps'),
        ),
      ),
    );
  });

  test('allows non-overlapping request within balance', () {
    expect(
      () => rules.validate(
        draft: draft(start: '2026-11-20', end: '2026-11-20'),
        companyToday: today,
        balance: balance,
        existing: const [],
      ),
      returnsNormally,
    );
  });

  test('requestedDays is inclusive of both ends', () {
    expect(rules.requestedDays('2026-11-18', '2026-11-20'), 3);
  });
}
