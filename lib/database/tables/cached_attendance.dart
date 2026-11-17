import 'package:drift/drift.dart';

class CachedAttendance extends Table {
  /// Company working day as yyyy-MM-dd.
  TextColumn get companyDate => text()();
  DateTimeColumn get checkInAt => dateTime().nullable()();
  DateTimeColumn get checkOutAt => dateTime().nullable()();
  RealColumn get checkInLat => real().nullable()();
  RealColumn get checkInLng => real().nullable()();
  RealColumn get checkOutLat => real().nullable()();
  RealColumn get checkOutLng => real().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {companyDate};
}
