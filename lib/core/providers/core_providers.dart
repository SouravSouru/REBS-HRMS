import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/data/latest.dart' as tzdata;

import '../../database/app_database.dart';
import '../config/app_config.dart';
import '../connectivity/connectivity_service.dart';
import '../location/debug_location_override.dart';
import '../location/location_service.dart';
import '../network/dio_client.dart';
import '../time/company_clock.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
AppConfig appConfig(AppConfigRef ref) => AppConfig.defaults;

@Riverpod(keepAlive: true)
AppDatabase appDatabase(AppDatabaseRef ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final config = ref.watch(appConfigProvider);
  return createDio(config);
}

@Riverpod(keepAlive: true)
CompanyClock companyClock(CompanyClockRef ref) {
  tzdata.initializeTimeZones();
  final config = ref.watch(appConfigProvider);
  return SystemCompanyClock(config.companyTimezone);
}

@Riverpod(keepAlive: true)
ConnectivityService connectivityService(ConnectivityServiceRef ref) {
  return ConnectivityService();
}

@Riverpod(keepAlive: true)
DebugLocationOverride debugLocationOverride(DebugLocationOverrideRef ref) {
  final config = ref.watch(appConfigProvider);
  return DebugLocationOverride(
    officeLat: config.officeLat,
    officeLng: config.officeLng,
  );
}

@Riverpod(keepAlive: true)
LocationService locationService(LocationServiceRef ref) {
  return LocationService(
    debugOverride: ref.watch(debugLocationOverrideProvider),
  );
}
