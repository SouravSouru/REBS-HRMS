// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncEngineHash() => r'60801b24e93d2f311945407d21f49c94c6cacbc7';

/// See also [syncEngine].
@ProviderFor(syncEngine)
final syncEngineProvider = Provider<SyncEngine>.internal(
  syncEngine,
  name: r'syncEngineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$syncEngineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SyncEngineRef = ProviderRef<SyncEngine>;
String _$syncControllerHash() => r'a0b7655a868dd57a76dfe450cdfe5c597f382e3b';

/// See also [SyncController].
@ProviderFor(SyncController)
final syncControllerProvider =
    NotifierProvider<SyncController, SyncUiState>.internal(
      SyncController.new,
      name: r'syncControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$syncControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SyncController = Notifier<SyncUiState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
