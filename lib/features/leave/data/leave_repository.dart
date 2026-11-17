import 'package:drift/drift.dart';

import '../../../database/app_database.dart';
import '../domain/models/leave_models.dart';
import 'datasources/leave_remote_datasource.dart';
import 'dto/leave_dto.dart';

class LeaveRepository {
  LeaveRepository({required this.db, required this.remote});

  final AppDatabase db;
  final LeaveRemoteDatasource remote;

  Stream<LeaveBalance?> watchBalance() {
    return db.watchLeaveBalance().map(
      (row) => row == null ? null : _balanceFromCache(row),
    );
  }

  Future<LeaveBalance?> getBalance() async {
    final row = await db.getLeaveBalance();
    return row == null ? null : _balanceFromCache(row);
  }

  Future<LeaveBalance> refreshBalance() async {
    final dto = await remote.fetchBalance();
    await db.upsertLeaveBalance(_balanceToCompanion(dto));
    return dto.toDomain();
  }

  Stream<List<LeaveRequest>> watchRequests() {
    return db.watchLeaveRequests().map(
      (rows) => rows.map(_requestFromCache).toList(),
    );
  }

  Future<List<LeaveRequest>> getRequests() async {
    final rows = await db.getLeaveRequests();
    return rows.map(_requestFromCache).toList();
  }

  Future<List<LeaveRequest>> refreshRequests() async {
    final dtos = await remote.fetchRequests();
    await db.replaceLeaveRequests(dtos.map(_requestToCompanion).toList());
    return dtos.map((d) => d.toDomain()).toList();
  }

  Future<LeaveRequest> submit(LeaveDraft draft) async {
    final dto = await remote.submit(draft);
    await db.upsertLeaveRequest(_requestToCompanion(dto));
    await refreshBalance();
    return dto.toDomain();
  }
}

LeaveBalance _balanceFromCache(CachedLeaveBalanceData row) {
  return LeaveBalance(casual: row.casual, sick: row.sick);
}

CachedLeaveBalanceCompanion _balanceToCompanion(LeaveBalanceDto dto) {
  return CachedLeaveBalanceCompanion(
    id: const Value(1),
    casual: Value(dto.casual),
    sick: Value(dto.sick),
    updatedAt: Value(DateTime.now().toUtc()),
  );
}

LeaveRequest _requestFromCache(CachedLeaveRequest row) {
  return LeaveRequest(
    id: row.id,
    type: row.type == 'sick' ? LeaveType.sick : LeaveType.casual,
    startDate: row.startDate,
    endDate: row.endDate,
    reason: row.reason,
    status: switch (row.status) {
      'approved' => LeaveStatus.approved,
      'rejected' => LeaveStatus.rejected,
      _ => LeaveStatus.pending,
    },
    days: row.days,
  );
}

CachedLeaveRequestsCompanion _requestToCompanion(LeaveRequestDto dto) {
  return CachedLeaveRequestsCompanion(
    id: Value(dto.id),
    type: Value(dto.type),
    startDate: Value(dto.startDate),
    endDate: Value(dto.endDate),
    reason: Value(dto.reason),
    status: Value(dto.status),
    days: Value(dto.days),
    updatedAt: Value(DateTime.now().toUtc()),
  );
}
