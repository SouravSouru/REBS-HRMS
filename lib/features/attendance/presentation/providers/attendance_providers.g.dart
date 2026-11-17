// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$attendanceRemoteHash() => r'042f1539080a37a04772fea00911ab4a5ae5c3be';

/// See also [attendanceRemote].
@ProviderFor(attendanceRemote)
final attendanceRemoteProvider = Provider<AttendanceRemoteDatasource>.internal(
  attendanceRemote,
  name: r'attendanceRemoteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attendanceRemoteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AttendanceRemoteRef = ProviderRef<AttendanceRemoteDatasource>;
String _$attendanceRepositoryHash() =>
    r'535ad38a9c980e659ef1e3d59c780dbd4e9a1688';

/// See also [attendanceRepository].
@ProviderFor(attendanceRepository)
final attendanceRepositoryProvider = Provider<AttendanceRepository>.internal(
  attendanceRepository,
  name: r'attendanceRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attendanceRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AttendanceRepositoryRef = ProviderRef<AttendanceRepository>;
String _$employeeHash() => r'10b079616a539a003b0d97361107c46c820dffdd';

/// See also [employee].
@ProviderFor(employee)
final employeeProvider = AutoDisposeStreamProvider<Employee?>.internal(
  employee,
  name: r'employeeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$employeeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EmployeeRef = AutoDisposeStreamProviderRef<Employee?>;
String _$recentAttendanceHash() => r'b08d86773289d7c0cb6107e7b63300d3c1a2c687';

/// See also [recentAttendance].
@ProviderFor(recentAttendance)
final recentAttendanceProvider =
    AutoDisposeStreamProvider<List<AttendanceRecord>>.internal(
      recentAttendance,
      name: r'recentAttendanceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recentAttendanceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecentAttendanceRef =
    AutoDisposeStreamProviderRef<List<AttendanceRecord>>;
String _$outboxEntriesHash() => r'0779ba9c96263fdd9e59c3b60373766b0ec64aba';

/// See also [outboxEntries].
@ProviderFor(outboxEntries)
final outboxEntriesProvider =
    AutoDisposeStreamProvider<List<OutboxEntry>>.internal(
      outboxEntries,
      name: r'outboxEntriesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$outboxEntriesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OutboxEntriesRef = AutoDisposeStreamProviderRef<List<OutboxEntry>>;
String _$pendingOutboxCountHash() =>
    r'591dcd14a5a1cd1978de2e6e41bf06a7e68fdd6f';

/// See also [pendingOutboxCount].
@ProviderFor(pendingOutboxCount)
final pendingOutboxCountProvider = AutoDisposeStreamProvider<int>.internal(
  pendingOutboxCount,
  name: r'pendingOutboxCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingOutboxCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingOutboxCountRef = AutoDisposeStreamProviderRef<int>;
String _$todayAttendanceHash() => r'c7cf84e43af9bdb72768f9ce861ae4c386c2d0d2';

/// See also [todayAttendance].
@ProviderFor(todayAttendance)
final todayAttendanceProvider =
    AutoDisposeStreamProvider<DayAttendanceState>.internal(
      todayAttendance,
      name: r'todayAttendanceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$todayAttendanceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodayAttendanceRef = AutoDisposeStreamProviderRef<DayAttendanceState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
