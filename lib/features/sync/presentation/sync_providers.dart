import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/error/app_exception.dart';
import '../../../core/providers/core_providers.dart';
import '../../attendance/domain/models/attendance_event.dart';
import '../../attendance/presentation/providers/attendance_providers.dart';
import '../../leave/presentation/providers/leave_providers.dart';
import '../data/sync_engine.dart';

part 'sync_providers.g.dart';

@Riverpod(keepAlive: true)
SyncEngine syncEngine(SyncEngineRef ref) {
  final remote = ref.watch(attendanceRemoteProvider);
  return SyncEngine(
    attendanceRepository: ref.watch(attendanceRepositoryProvider),
    clock: ref.watch(companyClockProvider),
    postEvent: (AttendanceEvent event) async {
      final response = await remote.postEvent(event);
      return (serverRecordId: response.id);
    },
  );
}

@Riverpod(keepAlive: true)
class SyncController extends _$SyncController {
  StreamSubscription<bool>? _connectivitySub;
  AppLifecycleListener? _lifecycle;

  @override
  SyncUiState build() {
    final connectivity = ref.watch(connectivityServiceProvider);
    _connectivitySub?.cancel();
    _connectivitySub = connectivity.onConnectivityChanged.listen((online) {
      if (online) {
        unawaited(syncNow(force: false));
      } else {
        state = state.copyWith(isOnline: false);
      }
    });

    _lifecycle?.dispose();
    _lifecycle = AppLifecycleListener(
      onResume: () {
        unawaited(syncNow(force: false));
      },
    );

    ref.onDispose(() {
      _connectivitySub?.cancel();
      _lifecycle?.dispose();
    });

    Future.microtask(() async {
      final online = await connectivity.isOnline;
      state = state.copyWith(isOnline: online);
      await refreshCaches(silent: true);
      await syncNow(force: true);
    });

    return const SyncUiState();
  }

  Future<void> refreshCaches({bool silent = false}) async {
    if (!silent) {
      state = state.copyWith(isRefreshing: true, clearError: true);
    }
    try {
      final attendance = ref.read(attendanceRepositoryProvider);
      final leave = ref.read(leaveRepositoryProvider);
      final online = await ref.read(connectivityServiceProvider).isOnline;
      state = state.copyWith(isOnline: online);
      if (!online) {
        if (!silent) {
          state = state.copyWith(
            isRefreshing: false,
            errorMessage: 'You are offline. Showing cached data.',
          );
        }
        return;
      }

      await Future.wait([
        attendance.refreshEmployee(),
        attendance.refreshAttendance(),
        leave.refreshBalance(),
        leave.refreshRequests(),
      ]);
      state = state.copyWith(isRefreshing: false, clearError: true);
    } catch (e) {
      state = state.copyWith(
        isRefreshing: false,
        errorMessage: e is AppException
            ? e.message
            : 'Could not refresh. Showing cached data if available.',
      );
    }
  }

  Future<SyncRunResult?> syncNow({bool force = true}) async {
    final online = await ref.read(connectivityServiceProvider).isOnline;
    state = state.copyWith(isOnline: online);
    if (!online) {
      state = state.copyWith(isSyncing: false);
      return null;
    }

    state = state.copyWith(isSyncing: true);
    try {
      final result = await ref.read(syncEngineProvider).sync(force: force);
      if (result.syncedCount > 0 || result.rejectedCount > 0) {
        await refreshCaches(silent: true);
      }
      state = state.copyWith(isSyncing: false, clearError: true);
      return result;
    } catch (e) {
      state = state.copyWith(
        isSyncing: false,
        errorMessage: e is AppException ? e.message : 'Sync failed.',
      );
      return null;
    }
  }
}

class SyncUiState {
  const SyncUiState({
    this.isOnline = true,
    this.isSyncing = false,
    this.isRefreshing = false,
    this.errorMessage,
  });

  final bool isOnline;
  final bool isSyncing;
  final bool isRefreshing;
  final String? errorMessage;

  SyncUiState copyWith({
    bool? isOnline,
    bool? isSyncing,
    bool? isRefreshing,
    String? errorMessage,
    bool clearError = false,
  }) {
    return SyncUiState(
      isOnline: isOnline ?? this.isOnline,
      isSyncing: isSyncing ?? this.isSyncing,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
