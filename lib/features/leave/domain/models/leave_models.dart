enum LeaveType { casual, sick }

enum LeaveStatus { pending, approved, rejected }

class LeaveBalance {
  const LeaveBalance({required this.casual, required this.sick});

  final double casual;
  final double sick;

  double forType(LeaveType type) => switch (type) {
    LeaveType.casual => casual,
    LeaveType.sick => sick,
  };
}

class LeaveRequest {
  const LeaveRequest({
    required this.id,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.status,
    required this.days,
  });

  final String id;
  final LeaveType type;
  final String startDate;
  final String endDate;
  final String reason;
  final LeaveStatus status;
  final double days;
}

class LeaveDraft {
  const LeaveDraft({
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.reason,
  });

  final LeaveType type;
  final String startDate;
  final String endDate;
  final String reason;
}
