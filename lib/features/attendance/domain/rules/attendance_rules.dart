import '../../../../core/error/app_exception.dart';
import '../../../../core/utils/haversine.dart';
import '../models/attendance_event.dart';
import '../models/attendance_record.dart';

class AttendanceRules {
  const AttendanceRules();

  bool hasEffectiveCheckIn({
    AttendanceRecord? cached,
    required List<OutboxEntry> outboxForDay,
  }) {
    if (cached?.hasCheckIn == true) return true;
    return outboxForDay.any(
      (e) =>
          e.type == AttendanceEventType.checkIn &&
          e.status != SyncBadge.rejected,
    );
  }

  bool hasEffectiveCheckOut({
    AttendanceRecord? cached,
    required List<OutboxEntry> outboxForDay,
  }) {
    if (cached?.hasCheckOut == true) return true;
    return outboxForDay.any(
      (e) =>
          e.type == AttendanceEventType.checkOut &&
          e.status != SyncBadge.rejected,
    );
  }

  void validateCheckIn({
    AttendanceRecord? cached,
    required List<OutboxEntry> outboxForDay,
  }) {
    if (hasEffectiveCheckIn(cached: cached, outboxForDay: outboxForDay)) {
      throw const AttendanceRuleException('You already checked in for today.');
    }
  }

  void validateCheckOut({
    AttendanceRecord? cached,
    required List<OutboxEntry> outboxForDay,
  }) {
    if (!hasEffectiveCheckIn(cached: cached, outboxForDay: outboxForDay)) {
      throw const AttendanceRuleException(
        'Check out is only allowed after a check-in for today.',
      );
    }
    if (hasEffectiveCheckOut(cached: cached, outboxForDay: outboxForDay)) {
      throw const AttendanceRuleException('You already checked out for today.');
    }
  }

  bool dependsOnRejectedCheckIn({
    required AttendanceEventType type,
    required List<OutboxEntry> outboxForDay,
    AttendanceRecord? cached,
  }) {
    if (type != AttendanceEventType.checkOut) return false;
    if (cached?.hasCheckIn == true) return false;

    final hasRejectedCheckIn = outboxForDay.any(
      (e) =>
          e.type == AttendanceEventType.checkIn &&
          e.status == SyncBadge.rejected,
    );
    if (!hasRejectedCheckIn) return false;

    final hasValidCheckIn = outboxForDay.any(
      (e) =>
          e.type == AttendanceEventType.checkIn &&
          e.status != SyncBadge.rejected,
    );
    return !hasValidCheckIn;
  }

  double distanceFromOffice({
    required double latitude,
    required double longitude,
    required double officeLat,
    required double officeLng,
  }) {
    return haversineMeters(
      lat1: latitude,
      lng1: longitude,
      lat2: officeLat,
      lng2: officeLng,
    );
  }

  void validateWithinRadius({
    required double latitude,
    required double longitude,
    required double officeLat,
    required double officeLng,
    required double radiusMeters,
  }) {
    final distance = distanceFromOffice(
      latitude: latitude,
      longitude: longitude,
      officeLat: officeLat,
      officeLng: officeLng,
    );
    if (distance > radiusMeters) {
      throw AttendanceRuleException(
        "You're ${distance.round()} m away from the office. "
        'Move within ${radiusMeters.round()} m to check in.',
      );
    }
  }
}
