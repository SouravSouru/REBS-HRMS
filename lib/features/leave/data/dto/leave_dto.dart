import '../../domain/models/leave_models.dart';

class LeaveBalanceDto {
  const LeaveBalanceDto({required this.casual, required this.sick});

  final double casual;
  final double sick;

  factory LeaveBalanceDto.fromJson(Map<String, dynamic> json) {
    return LeaveBalanceDto(
      casual: (json['casual'] as num).toDouble(),
      sick: (json['sick'] as num).toDouble(),
    );
  }

  LeaveBalance toDomain() => LeaveBalance(casual: casual, sick: sick);
}

class LeaveRequestDto {
  const LeaveRequestDto({
    required this.id,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.status,
    required this.days,
  });

  final String id;
  final String type;
  final String startDate;
  final String endDate;
  final String reason;
  final String status;
  final double days;

  factory LeaveRequestDto.fromJson(Map<String, dynamic> json) {
    return LeaveRequestDto(
      id: json['id'] as String,
      type: json['type'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      reason: json['reason'] as String,
      status: json['status'] as String,
      days: (json['days'] as num).toDouble(),
    );
  }

  LeaveRequest toDomain() => LeaveRequest(
    id: id,
    type: type == 'sick' ? LeaveType.sick : LeaveType.casual,
    startDate: startDate,
    endDate: endDate,
    reason: reason,
    status: switch (status) {
      'approved' => LeaveStatus.approved,
      'rejected' => LeaveStatus.rejected,
      _ => LeaveStatus.pending,
    },
    days: days,
  );
}

Map<String, dynamic> leaveDraftToJson(LeaveDraft draft) {
  return {
    'type': draft.type == LeaveType.sick ? 'sick' : 'casual',
    'startDate': draft.startDate,
    'endDate': draft.endDate,
    'reason': draft.reason,
  };
}
