import '../../domain/models/attendance_event.dart';
import '../../domain/models/attendance_record.dart';
import '../../domain/models/employee.dart';

class EmployeeDto {
  const EmployeeDto({
    required this.id,
    required this.name,
    required this.department,
    required this.officeLat,
    required this.officeLng,
    required this.radiusMeters,
    required this.timezone,
  });

  final String id;
  final String name;
  final String department;
  final double officeLat;
  final double officeLng;
  final double radiusMeters;
  final String timezone;

  factory EmployeeDto.fromJson(Map<String, dynamic> json) {
    return EmployeeDto(
      id: json['id'] as String,
      name: json['name'] as String,
      department: json['department'] as String,
      officeLat: (json['officeLat'] as num).toDouble(),
      officeLng: (json['officeLng'] as num).toDouble(),
      radiusMeters: (json['radiusMeters'] as num).toDouble(),
      timezone: json['timezone'] as String,
    );
  }

  Employee toDomain() => Employee(
    id: id,
    name: name,
    department: department,
    officeLat: officeLat,
    officeLng: officeLng,
    radiusMeters: radiusMeters,
    timezone: timezone,
  );
}

class AttendanceRecordDto {
  const AttendanceRecordDto({
    required this.companyDate,
    this.checkInAt,
    this.checkOutAt,
    this.checkInLat,
    this.checkInLng,
    this.checkOutLat,
    this.checkOutLng,
  });

  final String companyDate;
  final DateTime? checkInAt;
  final DateTime? checkOutAt;
  final double? checkInLat;
  final double? checkInLng;
  final double? checkOutLat;
  final double? checkOutLng;

  factory AttendanceRecordDto.fromJson(Map<String, dynamic> json) {
    DateTime? parse(dynamic v) =>
        v == null ? null : DateTime.parse(v as String).toUtc();
    return AttendanceRecordDto(
      companyDate: json['companyDate'] as String,
      checkInAt: parse(json['checkInAt']),
      checkOutAt: parse(json['checkOutAt']),
      checkInLat: (json['checkInLat'] as num?)?.toDouble(),
      checkInLng: (json['checkInLng'] as num?)?.toDouble(),
      checkOutLat: (json['checkOutLat'] as num?)?.toDouble(),
      checkOutLng: (json['checkOutLng'] as num?)?.toDouble(),
    );
  }

  AttendanceRecord toDomain() => AttendanceRecord(
    companyDate: companyDate,
    checkInAt: checkInAt,
    checkOutAt: checkOutAt,
    checkInLat: checkInLat,
    checkInLng: checkInLng,
    checkOutLat: checkOutLat,
    checkOutLng: checkOutLng,
  );
}

class AttendanceEventResponseDto {
  const AttendanceEventResponseDto({
    required this.id,
    required this.eventId,
    required this.type,
    required this.companyDate,
    required this.occurredAt,
  });

  final String id;
  final String eventId;
  final String type;
  final String companyDate;
  final DateTime occurredAt;

  factory AttendanceEventResponseDto.fromJson(Map<String, dynamic> json) {
    return AttendanceEventResponseDto(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      type: json['type'] as String,
      companyDate: json['companyDate'] as String,
      occurredAt: DateTime.parse(json['occurredAt'] as String).toUtc(),
    );
  }
}

Map<String, dynamic> attendanceEventToJson(AttendanceEvent event) {
  return {
    'eventId': event.eventId,
    'type': event.type == AttendanceEventType.checkIn ? 'checkIn' : 'checkOut',
    'companyDate': event.companyDate,
    'occurredAt': event.occurredAt.toUtc().toIso8601String(),
    'latitude': event.latitude,
    'longitude': event.longitude,
    'distanceFromOfficeMeters': event.distanceFromOfficeMeters,
  };
}
