import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/leave_remote_datasource.dart';
import '../../data/leave_repository.dart';
import '../../domain/models/leave_models.dart';

part 'leave_providers.g.dart';

@Riverpod(keepAlive: true)
LeaveRemoteDatasource leaveRemote(LeaveRemoteRef ref) {
  return LeaveRemoteDatasource(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
LeaveRepository leaveRepository(LeaveRepositoryRef ref) {
  return LeaveRepository(
    db: ref.watch(appDatabaseProvider),
    remote: ref.watch(leaveRemoteProvider),
  );
}

@riverpod
Stream<LeaveBalance?> leaveBalance(LeaveBalanceRef ref) {
  return ref.watch(leaveRepositoryProvider).watchBalance();
}

@riverpod
Stream<List<LeaveRequest>> leaveRequests(LeaveRequestsRef ref) {
  return ref.watch(leaveRepositoryProvider).watchRequests();
}
