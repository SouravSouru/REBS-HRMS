import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/core_providers.dart';
import '../../data/attendance_repository.dart';
import '../../data/datasources/attendance_remote_datasource.dart';
import '../../domain/models/attendance_event.dart';
import '../../domain/models/attendance_record.dart';
import '../../domain/models/day_attendance_state.dart';
import '../../domain/models/employee.dart';

part 'attendance_providers.g.dart';

@Riverpod(keepAlive: true)
AttendanceRemoteDatasource attendanceRemote(AttendanceRemoteRef ref) {
  return AttendanceRemoteDatasource(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
AttendanceRepository attendanceRepository(AttendanceRepositoryRef ref) {
  return AttendanceRepository(
    db: ref.watch(appDatabaseProvider),
    remote: ref.watch(attendanceRemoteProvider),
  );
}

@riverpod
Stream<Employee?> employee(EmployeeRef ref) {
  return ref.watch(attendanceRepositoryProvider).watchEmployee();
}

@riverpod
Stream<List<AttendanceRecord>> recentAttendance(RecentAttendanceRef ref) {
  return ref.watch(attendanceRepositoryProvider).watchRecent(limit: 5);
}

@riverpod
Stream<List<OutboxEntry>> outboxEntries(OutboxEntriesRef ref) {
  return ref.watch(attendanceRepositoryProvider).watchOutbox();
}

@riverpod
Stream<int> pendingOutboxCount(PendingOutboxCountRef ref) {
  return ref.watch(attendanceRepositoryProvider).watchPendingCount();
}

@riverpod
Stream<DayAttendanceState> todayAttendance(TodayAttendanceRef ref) {
  final clock = ref.watch(companyClockProvider);
  final repo = ref.watch(attendanceRepositoryProvider);
  final companyDate = clock.todayCompanyDate();

  return Stream.multi((listener) {
    var cancelled = false;

    Future<void> emit() async {
      final cached = await repo.getToday(companyDate);
      final outbox = await repo.getOutboxForDate(companyDate);
      if (cancelled) return;
      listener.add(
        DayAttendanceState.fromCacheAndOutbox(
          companyDate: companyDate,
          cached: cached,
          outboxForDay: outbox,
        ),
      );
    }

    final subs = <StreamSubscription<dynamic>>[
      repo.watchToday(companyDate).listen((_) => emit()),
      repo.watchOutboxForDate(companyDate).listen((_) => emit()),
    ];

    listener.onCancel = () async {
      cancelled = true;
      for (final sub in subs) {
        await sub.cancel();
      }
    };
  });
}
