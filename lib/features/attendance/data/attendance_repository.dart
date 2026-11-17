import 'package:drift/drift.dart';

import '../../../database/app_database.dart';
import '../domain/models/attendance_event.dart';
import '../domain/models/attendance_record.dart';
import '../domain/models/employee.dart';
import 'datasources/attendance_remote_datasource.dart';
import 'dto/attendance_dto.dart';

class AttendanceRepository {
  AttendanceRepository({required this.db, required this.remote});

  final AppDatabase db;
  final AttendanceRemoteDatasource remote;

  Stream<Employee?> watchEmployee() {
    return db.watchEmployee().map(
      (row) => row == null ? null : _employeeFromCache(row),
    );
  }

  Future<Employee?> getEmployee() async {
    final row = await db.getEmployee();
    return row == null ? null : _employeeFromCache(row);
  }

  Future<Employee> refreshEmployee() async {
    final dto = await remote.fetchEmployee();
    await db.upsertEmployee(_employeeToCompanion(dto));
    return dto.toDomain();
  }

  Stream<AttendanceRecord?> watchToday(String companyDate) {
    return db
        .watchAttendanceForDate(companyDate)
        .map((row) => row == null ? null : _attendanceFromCache(row));
  }

  Future<AttendanceRecord?> getToday(String companyDate) async {
    final row = await db.getAttendanceForDate(companyDate);
    return row == null ? null : _attendanceFromCache(row);
  }

  Stream<List<AttendanceRecord>> watchRecent({int limit = 5}) {
    return db
        .watchRecentAttendance(limit: limit)
        .map((rows) => rows.map(_attendanceFromCache).toList());
  }

  Future<List<AttendanceRecord>> refreshAttendance({String? month}) async {
    final dtos = await remote.fetchAttendance(month: month);
    await db.replaceAttendance(dtos.map(_attendanceToCompanion).toList());
    return dtos.map((d) => d.toDomain()).toList();
  }

  Stream<List<OutboxEntry>> watchOutbox() {
    return db.watchOutbox().map((rows) => rows.map(_outboxFromCache).toList());
  }

  Stream<List<OutboxEntry>> watchOutboxForDate(String companyDate) {
    return db
        .watchOutboxForDate(companyDate)
        .map((rows) => rows.map(_outboxFromCache).toList());
  }

  Stream<int> watchPendingCount() => db.watchPendingOutboxCount();

  Future<List<OutboxEntry>> getPendingOutbox() async {
    final rows = await db.getPendingOutbox();
    return rows.map(_outboxFromCache).toList();
  }

  Future<List<OutboxEntry>> getOutboxForDate(String companyDate) async {
    final rows = await db.getOutboxForDate(companyDate);
    return rows.map(_outboxFromCache).toList();
  }

  Future<OutboxEntry> enqueueEvent(AttendanceEvent event) async {
    final row = await db.insertOutbox(
      AttendanceOutboxCompanion.insert(
        eventId: event.eventId,
        type: event.type == AttendanceEventType.checkOut
            ? OutboxEventType.checkOut
            : OutboxEventType.checkIn,
        companyDate: event.companyDate,
        occurredAt: event.occurredAt,
        latitude: event.latitude,
        longitude: event.longitude,
        distanceFromOfficeMeters: event.distanceFromOfficeMeters,
        status: OutboxStatus.pending,
      ),
    );
    return _outboxFromCache(row);
  }

  Future<void> markSynced({
    required int sequence,
    required String serverRecordId,
  }) {
    return db.updateOutbox(
      AttendanceOutboxCompanion(
        sequence: Value(sequence),
        status: const Value(OutboxStatus.synced),
        serverRecordId: Value(serverRecordId),
        lastAttemptAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  Future<void> markRejected({required int sequence, required String reason}) {
    return db.updateOutbox(
      AttendanceOutboxCompanion(
        sequence: Value(sequence),
        status: const Value(OutboxStatus.rejected),
        rejectReason: Value(reason),
        lastAttemptAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  Future<void> markAttempt({
    required int sequence,
    required int attemptCount,
    required DateTime attemptedAt,
  }) {
    return db.updateOutbox(
      AttendanceOutboxCompanion(
        sequence: Value(sequence),
        attemptCount: Value(attemptCount),
        lastAttemptAt: Value(attemptedAt),
      ),
    );
  }
}

Employee _employeeFromCache(CachedEmployeeData row) {
  return Employee(
    id: row.id,
    name: row.name,
    department: row.department,
    officeLat: row.officeLat,
    officeLng: row.officeLng,
    radiusMeters: row.radiusMeters,
    timezone: row.timezone,
  );
}

CachedEmployeeCompanion _employeeToCompanion(EmployeeDto dto) {
  return CachedEmployeeCompanion(
    id: Value(dto.id),
    name: Value(dto.name),
    department: Value(dto.department),
    officeLat: Value(dto.officeLat),
    officeLng: Value(dto.officeLng),
    radiusMeters: Value(dto.radiusMeters),
    timezone: Value(dto.timezone),
    updatedAt: Value(DateTime.now().toUtc()),
  );
}

AttendanceRecord _attendanceFromCache(CachedAttendanceData row) {
  return AttendanceRecord(
    companyDate: row.companyDate,
    checkInAt: row.checkInAt,
    checkOutAt: row.checkOutAt,
    checkInLat: row.checkInLat,
    checkInLng: row.checkInLng,
    checkOutLat: row.checkOutLat,
    checkOutLng: row.checkOutLng,
  );
}

CachedAttendanceCompanion _attendanceToCompanion(AttendanceRecordDto dto) {
  return CachedAttendanceCompanion(
    companyDate: Value(dto.companyDate),
    checkInAt: Value(dto.checkInAt),
    checkOutAt: Value(dto.checkOutAt),
    checkInLat: Value(dto.checkInLat),
    checkInLng: Value(dto.checkInLng),
    checkOutLat: Value(dto.checkOutLat),
    checkOutLng: Value(dto.checkOutLng),
    updatedAt: Value(DateTime.now().toUtc()),
  );
}

OutboxEntry _outboxFromCache(AttendanceOutboxData row) {
  return OutboxEntry(
    sequence: row.sequence,
    eventId: row.eventId,
    type: row.type == OutboxEventType.checkOut
        ? AttendanceEventType.checkOut
        : AttendanceEventType.checkIn,
    companyDate: row.companyDate,
    occurredAt: row.occurredAt,
    latitude: row.latitude,
    longitude: row.longitude,
    distanceFromOfficeMeters: row.distanceFromOfficeMeters,
    status: switch (row.status) {
      OutboxStatus.synced => SyncBadge.synced,
      OutboxStatus.rejected => SyncBadge.rejected,
      _ => SyncBadge.pending,
    },
    attemptCount: row.attemptCount,
    lastAttemptAt: row.lastAttemptAt,
    rejectReason: row.rejectReason,
    serverRecordId: row.serverRecordId,
  );
}

AttendanceEvent eventFromOutbox(OutboxEntry entry) {
  return AttendanceEvent(
    eventId: entry.eventId,
    type: entry.type,
    companyDate: entry.companyDate,
    occurredAt: entry.occurredAt,
    latitude: entry.latitude,
    longitude: entry.longitude,
    distanceFromOfficeMeters: entry.distanceFromOfficeMeters,
  );
}
