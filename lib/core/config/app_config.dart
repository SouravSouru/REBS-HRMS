class AppConfig {
  const AppConfig({
    required this.apiBaseUrl,
    required this.officeLat,
    required this.officeLng,
    required this.radiusMeters,
    required this.companyTimezone,
  });

  final String apiBaseUrl;
  final double officeLat;
  final double officeLng;
  final double radiusMeters;
  final String companyTimezone;

  static AppConfig get defaults => AppConfig(
    apiBaseUrl: const String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'http://10.0.2.2:3000',
    ),
    officeLat: _doubleDefine(
      const String.fromEnvironment('OFFICE_LAT'),
      12.9716,
    ),
    officeLng: _doubleDefine(
      const String.fromEnvironment('OFFICE_LNG'),
      77.5946,
    ),
    radiusMeters: _doubleDefine(
      const String.fromEnvironment('RADIUS_METERS'),
      200,
    ),
    companyTimezone: const String.fromEnvironment(
      'COMPANY_TIMEZONE',
      defaultValue: 'Asia/Kolkata',
    ),
  );

  static double _doubleDefine(String raw, double fallback) {
    if (raw.isEmpty) return fallback;
    return double.tryParse(raw) ?? fallback;
  }
}
