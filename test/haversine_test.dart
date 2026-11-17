import 'package:flutter_test/flutter_test.dart';
import 'package:rebs_hrms/core/utils/haversine.dart';

void main() {
  test('haversine returns ~0 for identical points', () {
    final d = haversineMeters(
      lat1: 12.9716,
      lng1: 77.5946,
      lat2: 12.9716,
      lng2: 77.5946,
    );
    expect(d, closeTo(0, 0.01));
  });

  test('haversine is about 300 m for 0.0027 deg latitude delta', () {
    final d = haversineMeters(
      lat1: 12.9716,
      lng1: 77.5946,
      lat2: 12.9716 + 0.0027,
      lng2: 77.5946,
    );
    expect(d, closeTo(300, 20));
  });
}
