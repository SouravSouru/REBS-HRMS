import 'package:flutter/foundation.dart';

import 'location_service.dart';

/// Debug-only presets. In release builds [current] always returns null.
class DebugLocationOverride {
  DebugLocationOverride({required this.officeLat, required this.officeLng});

  final double officeLat;
  final double officeLng;

  DebugLocationPreset? _preset;

  DebugLocationPreset? get preset => kReleaseMode ? null : _preset;

  set preset(DebugLocationPreset? value) {
    if (kReleaseMode) return;
    _preset = value;
  }

  GeoPoint? get current {
    if (kReleaseMode) return null;
    final selected = _preset;
    if (selected == null) return null;
    return switch (selected) {
      DebugLocationPreset.atOffice => GeoPoint(
        latitude: officeLat,
        longitude: officeLng,
      ),
      // ~300 m north of office (approx 0.0027 deg latitude).
      DebugLocationPreset.nearby300m => GeoPoint(
        latitude: officeLat + 0.0027,
        longitude: officeLng,
      ),
      DebugLocationPreset.farAway => GeoPoint(
        latitude: officeLat + 0.05,
        longitude: officeLng + 0.05,
      ),
    };
  }
}

enum DebugLocationPreset { atOffice, nearby300m, farAway }
