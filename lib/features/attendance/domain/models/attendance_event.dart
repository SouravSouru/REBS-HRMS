enum AttendanceEventType { checkIn, checkOut }

enum SyncBadge { pending, synced, rejected }

class AttendanceEvent {
  const AttendanceEvent({
    required this.eventId,
    required this.type,
    required this.companyDate,
    required this.occurredAt,
    required this.latitude,
    required this.longitude,
    required this.distanceFromOfficeMeters,
  });

  final String eventId;
  final AttendanceEventType type;
  final String companyDate;
  final DateTime occurredAt;
  final double latitude;
  final double longitude;
  final double distanceFromOfficeMeters;
}

class OutboxEntry {
  const OutboxEntry({
    required this.sequence,
    required this.eventId,
    required this.type,
    required this.companyDate,
    required this.occurredAt,
    required this.latitude,
    required this.longitude,
    required this.distanceFromOfficeMeters,
    required this.status,
    required this.attemptCount,
    this.lastAttemptAt,
    this.rejectReason,
    this.serverRecordId,
  });

  final int sequence;
  final String eventId;
  final AttendanceEventType type;
  final String companyDate;
  final DateTime occurredAt;
  final double latitude;
  final double longitude;
  final double distanceFromOfficeMeters;
  final SyncBadge status;
  final int attemptCount;
  final DateTime? lastAttemptAt;
  final String? rejectReason;
  final String? serverRecordId;
}
