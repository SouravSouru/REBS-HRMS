import 'package:drift/drift.dart';

class AttendanceOutbox extends Table {
  /// Autoincrement defines FIFO sync order.
  IntColumn get sequence => integer().autoIncrement()();
  TextColumn get eventId => text().unique()();
  TextColumn get type => text()();
  TextColumn get companyDate => text()();
  DateTimeColumn get occurredAt => dateTime()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  RealColumn get distanceFromOfficeMeters => real()();
  TextColumn get status => text()();
  IntColumn get attemptCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastAttemptAt => dateTime().nullable()();
  TextColumn get rejectReason => text().nullable()();
  TextColumn get serverRecordId => text().nullable()();
}
