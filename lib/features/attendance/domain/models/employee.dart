class Employee {
  const Employee({
    required this.id,
    required this.name,
    required this.department,
    required this.officeLat,
    required this.officeLng,
    required this.radiusMeters,
    required this.timezone,
  });

  final String id;
  final String name;
  final String department;
  final double officeLat;
  final double officeLng;
  final double radiusMeters;
  final String timezone;
}
