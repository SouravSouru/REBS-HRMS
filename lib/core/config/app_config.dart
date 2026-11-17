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

  static const AppConfig defaults = AppConfig(
    apiBaseUrl: 'http://10.0.2.2:3000',
    officeLat: 12.9716,
    officeLng: 77.5946,
    radiusMeters: 200,
    companyTimezone: 'Asia/Kolkata',
  );
}
