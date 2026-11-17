import '../../../../core/error/app_exception.dart';
import '../models/leave_models.dart';

class LeaveRules {
  const LeaveRules();

  /// Inclusive calendar days between yyyy-MM-dd strings.
  double requestedDays(String startDate, String endDate) {
    final start = DateTime.parse(startDate);
    final end = DateTime.parse(endDate);
    return end.difference(start).inDays + 1.0;
  }

  void validate({
    required LeaveDraft draft,
    required String companyToday,
    required LeaveBalance balance,
    required List<LeaveRequest> existing,
  }) {
    if (draft.startDate.compareTo(companyToday) < 0) {
      throw const LeaveRuleException(
        'Start date cannot be before today (company date).',
      );
    }
    if (draft.endDate.compareTo(draft.startDate) < 0) {
      throw const LeaveRuleException(
        'End date cannot be before the start date.',
      );
    }

    final trimmedReason = draft.reason.trim();
    if (trimmedReason.replaceAll(RegExp(r'\s+'), '').length < 10) {
      throw const LeaveRuleException(
        'Reason must contain at least 10 non-whitespace characters.',
      );
    }

    final days = requestedDays(draft.startDate, draft.endDate);
    final available = balance.forType(draft.type);
    if (days > available) {
      throw LeaveRuleException(
        'Requested ${days.toInt()} day(s) exceeds your '
        '${_typeLabel(draft.type)} balance of ${available.toInt()}.',
      );
    }

    final blocking = existing.where(
      (r) =>
          r.status == LeaveStatus.pending || r.status == LeaveStatus.approved,
    );
    for (final request in blocking) {
      if (_overlaps(
        draft.startDate,
        draft.endDate,
        request.startDate,
        request.endDate,
      )) {
        throw const LeaveRuleException(
          'This request overlaps an existing pending or approved leave.',
        );
      }
    }
  }

  bool _overlaps(String aStart, String aEnd, String bStart, String bEnd) {
    return aStart.compareTo(bEnd) <= 0 && bStart.compareTo(aEnd) <= 0;
  }

  String _typeLabel(LeaveType type) => switch (type) {
    LeaveType.casual => 'casual',
    LeaveType.sick => 'sick',
  };
}
