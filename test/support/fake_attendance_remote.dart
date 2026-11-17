import 'package:rebs_hrms/core/error/app_exception.dart';
import 'package:rebs_hrms/features/attendance/data/dto/attendance_dto.dart';
import 'package:rebs_hrms/features/attendance/domain/models/attendance_event.dart';

class FakeAttendanceApi {
  final Map<String, AttendanceEventResponseDto> byEventId = {};
  final Set<String> checkInDates = {};
  final List<String> postedEventIds = [];

  Exception? nextError;
  bool hangOnce = false;
  int hangCalls = 0;

  Future<({String serverRecordId})> postEvent(AttendanceEvent event) async {
    postedEventIds.add(event.eventId);

    if (byEventId.containsKey(event.eventId)) {
      final existing = byEventId[event.eventId]!;
      return (serverRecordId: existing.id);
    }

    if (hangOnce && hangCalls == 0) {
      hangCalls++;
      // Simulate timeout after the server may have accepted the write.
      byEventId[event.eventId] = AttendanceEventResponseDto(
        id: 'srv-${event.eventId}',
        eventId: event.eventId,
        type: event.type.name,
        companyDate: event.companyDate,
        occurredAt: event.occurredAt,
      );
      if (event.type == AttendanceEventType.checkIn) {
        checkInDates.add(event.companyDate);
      }
      throw const NetworkException('The request timed out.');
    }

    if (nextError != null) {
      final error = nextError!;
      nextError = null;
      throw error;
    }

    if (event.type == AttendanceEventType.checkIn) {
      if (checkInDates.contains(event.companyDate)) {
        throw const ServerException(
          'Attendance already exists for this day.',
          statusCode: 409,
        );
      }
      checkInDates.add(event.companyDate);
    } else if (!checkInDates.contains(event.companyDate)) {
      throw const ServerException(
        'Check out requires a check-in for this day.',
        statusCode: 422,
      );
    }

    final response = AttendanceEventResponseDto(
      id: 'srv-${event.eventId}',
      eventId: event.eventId,
      type: event.type.name,
      companyDate: event.companyDate,
      occurredAt: event.occurredAt,
    );
    byEventId[event.eventId] = response;
    return (serverRecordId: response.id);
  }
}
