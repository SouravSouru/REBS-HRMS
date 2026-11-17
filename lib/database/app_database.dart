import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/attendance_outbox.dart';
import 'tables/cached_attendance.dart';
import 'tables/cached_employee.dart';
import 'tables/cached_leave_balance.dart';
import 'tables/cached_leave_requests.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CachedEmployee,
    CachedAttendance,
    CachedLeaveBalance,
    CachedLeaveRequests,
    AttendanceOutbox,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _open());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _open() {
    return driftDatabase(name: 'rebs_hrms');
  }

  Stream<CachedEmployeeData?> watchEmployee() {
    return (select(cachedEmployee)..limit(1)).watchSingleOrNull();
  }

  Future<CachedEmployeeData?> getEmployee() {
    return (select(cachedEmployee)..limit(1)).getSingleOrNull();
  }

  Future<void> upsertEmployee(CachedEmployeeCompanion row) {
    return into(cachedEmployee).insertOnConflictUpdate(row);
  }

  Stream<CachedAttendanceData?> watchAttendanceForDate(String companyDate) {
    return (select(
      cachedAttendance,
    )..where((t) => t.companyDate.equals(companyDate))).watchSingleOrNull();
  }

  Future<CachedAttendanceData?> getAttendanceForDate(String companyDate) {
    return (select(
      cachedAttendance,
    )..where((t) => t.companyDate.equals(companyDate))).getSingleOrNull();
  }

  Stream<List<CachedAttendanceData>> watchRecentAttendance({int limit = 5}) {
    return (select(cachedAttendance)
          ..orderBy([(t) => OrderingTerm.desc(t.companyDate)])
          ..limit(limit))
        .watch();
  }

  Future<void> replaceAttendance(List<CachedAttendanceCompanion> rows) async {
    await transaction(() async {
      await delete(cachedAttendance).go();
      for (final row in rows) {
        await into(cachedAttendance).insertOnConflictUpdate(row);
      }
    });
  }

  Stream<CachedLeaveBalanceData?> watchLeaveBalance() {
    return (select(cachedLeaveBalance)..limit(1)).watchSingleOrNull();
  }

  Future<CachedLeaveBalanceData?> getLeaveBalance() {
    return (select(cachedLeaveBalance)..limit(1)).getSingleOrNull();
  }

  Future<void> upsertLeaveBalance(CachedLeaveBalanceCompanion row) {
    return into(cachedLeaveBalance).insertOnConflictUpdate(row);
  }

  Stream<List<CachedLeaveRequest>> watchLeaveRequests() {
    return (select(
      cachedLeaveRequests,
    )..orderBy([(t) => OrderingTerm.desc(t.startDate)])).watch();
  }

  Future<List<CachedLeaveRequest>> getLeaveRequests() {
    return (select(
      cachedLeaveRequests,
    )..orderBy([(t) => OrderingTerm.desc(t.startDate)])).get();
  }

  Future<void> replaceLeaveRequests(
    List<CachedLeaveRequestsCompanion> rows,
  ) async {
    await transaction(() async {
      await delete(cachedLeaveRequests).go();
      for (final row in rows) {
        await into(cachedLeaveRequests).insertOnConflictUpdate(row);
      }
    });
  }

  Future<void> upsertLeaveRequest(CachedLeaveRequestsCompanion row) {
    return into(cachedLeaveRequests).insertOnConflictUpdate(row);
  }

  Stream<List<AttendanceOutboxData>> watchOutbox() {
    return (select(
      attendanceOutbox,
    )..orderBy([(t) => OrderingTerm.asc(t.sequence)])).watch();
  }

  Future<List<AttendanceOutboxData>> getPendingOutbox() {
    return (select(attendanceOutbox)
          ..where((t) => t.status.equals(OutboxStatus.pending))
          ..orderBy([(t) => OrderingTerm.asc(t.sequence)]))
        .get();
  }

  Future<List<AttendanceOutboxData>> getOutboxForDate(String companyDate) {
    return (select(attendanceOutbox)
          ..where((t) => t.companyDate.equals(companyDate))
          ..orderBy([(t) => OrderingTerm.asc(t.sequence)]))
        .get();
  }

  Stream<List<AttendanceOutboxData>> watchOutboxForDate(String companyDate) {
    return (select(attendanceOutbox)
          ..where((t) => t.companyDate.equals(companyDate))
          ..orderBy([(t) => OrderingTerm.asc(t.sequence)]))
        .watch();
  }

  Future<int> pendingOutboxCount() async {
    final count = attendanceOutbox.sequence.count();
    final query = selectOnly(attendanceOutbox)
      ..addColumns([count])
      ..where(attendanceOutbox.status.equals(OutboxStatus.pending));
    final row = await query.getSingle();
    return row.read(count) ?? 0;
  }

  Stream<int> watchPendingOutboxCount() {
    final count = attendanceOutbox.sequence.count();
    final query = selectOnly(attendanceOutbox)
      ..addColumns([count])
      ..where(attendanceOutbox.status.equals(OutboxStatus.pending));
    return query.watchSingle().map((row) => row.read(count) ?? 0);
  }

  Future<AttendanceOutboxData> insertOutbox(AttendanceOutboxCompanion row) {
    return into(attendanceOutbox).insertReturning(row);
  }

  Future<void> updateOutbox(AttendanceOutboxCompanion row) {
    return (update(
      attendanceOutbox,
    )..where((t) => t.sequence.equals(row.sequence.value))).write(row);
  }
}

abstract final class OutboxStatus {
  static const pending = 'pending';
  static const synced = 'synced';
  static const rejected = 'rejected';
}

abstract final class OutboxEventType {
  static const checkIn = 'checkIn';
  static const checkOut = 'checkOut';
}
