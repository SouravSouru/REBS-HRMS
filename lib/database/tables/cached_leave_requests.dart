import 'package:drift/drift.dart';

class CachedLeaveRequests extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get startDate => text()();
  TextColumn get endDate => text()();
  TextColumn get reason => text()();
  TextColumn get status => text()();
  RealColumn get days => real()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
