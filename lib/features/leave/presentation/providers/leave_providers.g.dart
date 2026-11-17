// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leaveRemoteHash() => r'8a9d03653c69969e4bbed2ba3d485fa35835cac6';

/// See also [leaveRemote].
@ProviderFor(leaveRemote)
final leaveRemoteProvider = Provider<LeaveRemoteDatasource>.internal(
  leaveRemote,
  name: r'leaveRemoteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$leaveRemoteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LeaveRemoteRef = ProviderRef<LeaveRemoteDatasource>;
String _$leaveRepositoryHash() => r'7aa1b3124ca0bd8e67eeb6cd8a3089c1a655a7ab';

/// See also [leaveRepository].
@ProviderFor(leaveRepository)
final leaveRepositoryProvider = Provider<LeaveRepository>.internal(
  leaveRepository,
  name: r'leaveRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$leaveRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LeaveRepositoryRef = ProviderRef<LeaveRepository>;
String _$leaveBalanceHash() => r'7316756a83bedcc41d843cbd624ae0a5927e5961';

/// See also [leaveBalance].
@ProviderFor(leaveBalance)
final leaveBalanceProvider = AutoDisposeStreamProvider<LeaveBalance?>.internal(
  leaveBalance,
  name: r'leaveBalanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$leaveBalanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LeaveBalanceRef = AutoDisposeStreamProviderRef<LeaveBalance?>;
String _$leaveRequestsHash() => r'ae84a3980e65fd6fb75abdbc32ce518b7a2bb707';

/// See also [leaveRequests].
@ProviderFor(leaveRequests)
final leaveRequestsProvider =
    AutoDisposeStreamProvider<List<LeaveRequest>>.internal(
      leaveRequests,
      name: r'leaveRequestsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$leaveRequestsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LeaveRequestsRef = AutoDisposeStreamProviderRef<List<LeaveRequest>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
