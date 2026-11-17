import 'dart:async';

import 'package:geolocator/geolocator.dart';

import '../error/app_exception.dart';
import 'debug_location_override.dart';

class GeoPoint {
  const GeoPoint({required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
}

class LocationService {
  LocationService({this.debugOverride});

  final DebugLocationOverride? debugOverride;

  Future<GeoPoint> currentPosition() async {
    final override = debugOverride?.current;
    if (override != null) return override;

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationException(
        'Location services are turned off. Enable GPS to check in.',
        kind: LocationFailureKind.servicesDisabled,
      );
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const LocationException(
          'Location permission was denied. Allow location access to check in.',
          kind: LocationFailureKind.denied,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw const LocationException(
        'Location permission is permanently denied. Open settings to allow access.',
        kind: LocationFailureKind.permanentlyDenied,
      );
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );
      return GeoPoint(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } on TimeoutException {
      throw const LocationException(
        'Could not get your location in time. Try again outdoors or near a window.',
        kind: LocationFailureKind.timeout,
      );
    } catch (e) {
      if (e is LocationException) rethrow;
      throw const LocationException(
        'Location is unavailable right now. Try again in a moment.',
        kind: LocationFailureKind.unavailable,
      );
    }
  }

  Future<bool> openSettings() => Geolocator.openAppSettings();

  Future<bool> openLocationSettings() => Geolocator.openLocationSettings();
}
