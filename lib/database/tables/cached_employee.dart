import 'package:drift/drift.dart';

class CachedEmployee extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get department => text()();
  RealColumn get officeLat => real()();
  RealColumn get officeLng => real()();
  RealColumn get radiusMeters => real()();
  TextColumn get timezone => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
