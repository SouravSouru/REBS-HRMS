class AttendanceRecord {
  const AttendanceRecord({
    required this.companyDate,
    this.checkInAt,
    this.checkOutAt,
    this.checkInLat,
    this.checkInLng,
    this.checkOutLat,
    this.checkOutLng,
  });

  final String companyDate;
  final DateTime? checkInAt;
  final DateTime? checkOutAt;
  final double? checkInLat;
  final double? checkInLng;
  final double? checkOutLat;
  final double? checkOutLng;

  bool get hasCheckIn => checkInAt != null;
  bool get hasCheckOut => checkOutAt != null;
}
