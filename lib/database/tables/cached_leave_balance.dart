import 'package:drift/drift.dart';

class CachedLeaveBalance extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  RealColumn get casual => real()();
  RealColumn get sick => real()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
