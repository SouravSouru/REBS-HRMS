import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:rebs_hrms/core/error/app_exception.dart';
import 'package:rebs_hrms/core/time/company_clock.dart';
import 'package:rebs_hrms/database/app_database.dart';
import 'package:rebs_hrms/features/attendance/data/attendance_repository.dart';
import 'package:rebs_hrms/features/attendance/data/datasources/attendance_remote_datasource.dart';
import 'package:rebs_hrms/features/attendance/domain/models/attendance_event.dart';
import 'package:rebs_hrms/features/sync/data/sync_engine.dart';
import 'package:timezone/data/latest.dart' as tzdata;

import 'support/fake_attendance_remote.dart';

void main() {
  late Directory tempDir;
  late File dbFile;
  late AppDatabase db;
  late AttendanceRepository repo;
  late FakeAttendanceApi api;
  late FakeCompanyClock clock;
  late SyncEngine engine;

  setUpAll(tzdata.initializeTimeZones);

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('rebs_hrms_test_');
    dbFile = File(p.join(tempDir.path, 'test.sqlite'));
    db = AppDatabase(NativeDatabase(dbFile));
    repo = AttendanceRepository(
      db: db,
      remote: AttendanceRemoteDatasource(Dio()),
    );
    api = FakeAttendanceApi();
    clock = FakeCompanyClock(
      fixedUtc: DateTime.utc(2026, 11, 17, 5),
      timezoneId: 'Asia/Kolkata',
    );
    engine = SyncEngine(
      attendanceRepository: repo,
      postEvent: api.postEvent,
      clock: clock,
    );
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  AttendanceEvent event({
    required String id,
    required AttendanceEventType type,
    String date = '2026-11-17',
  }) {
    return AttendanceEvent(
      eventId: id,
      type: type,
      companyDate: date,
      occurredAt: clock.nowUtc(),
      latitude: 12.9716,
      longitude: 77.5946,
      distanceFromOfficeMeters: 5,
    );
  }

  test('pending events survive database close/reopen', () async {
    await repo.enqueueEvent(event(id: 'a', type: AttendanceEventType.checkIn));
    await repo.enqueueEvent(event(id: 'b', type: AttendanceEventType.checkOut));
    await db.close();

    db = AppDatabase(NativeDatabase(dbFile));
    repo = AttendanceRepository(
      db: db,
      remote: AttendanceRemoteDatasource(Dio()),
    );
    final pending = await repo.getPendingOutbox();
    expect(pending.map((e) => e.eventId).toList(), ['a', 'b']);
    expect(pending.map((e) => e.sequence).toList(), [1, 2]);
  });

  test('events sync in ascending sequence order', () async {
    await repo.enqueueEvent(event(id: 'a', type: AttendanceEventType.checkIn));
    await repo.enqueueEvent(event(id: 'b', type: AttendanceEventType.checkOut));

    final result = await engine.sync(force: true);
    expect(result.syncedCount, 2);
    expect(api.postedEventIds, ['a', 'b']);
    expect(await repo.getPendingOutbox(), isEmpty);
  });

  test(
    'retryable failure stops the run without reordering later events',
    () async {
      await repo.enqueueEvent(
        event(id: 'in', type: AttendanceEventType.checkIn),
      );
      await repo.enqueueEvent(
        event(id: 'out', type: AttendanceEventType.checkOut),
      );

      api.nextError = const NetworkException('connection lost');
      final first = await engine.sync(force: true);
      expect(first.stopReason, SyncStopReason.retryableFailure);
      expect(api.postedEventIds, ['in']);
      expect((await repo.getPendingOutbox()).map((e) => e.eventId).toList(), [
        'in',
        'out',
      ]);

      final second = await engine.sync(force: true);
      expect(second.syncedCount, 2);
      expect(api.postedEventIds, ['in', 'in', 'out']);
    },
  );

  test(
    'same eventId retried after timeout does not create a duplicate',
    () async {
      await repo.enqueueEvent(
        event(id: 'same', type: AttendanceEventType.checkIn),
      );
      api.hangOnce = true;

      final first = await engine.sync(force: true);
      expect(first.stopReason, SyncStopReason.retryableFailure);
      expect(api.byEventId.containsKey('same'), isTrue);

      final second = await engine.sync(force: true);
      expect(second.syncedCount, 1);
      expect(api.byEventId.length, 1);
      expect(api.checkInDates.length, 1);
    },
  );

  test(
    '409 marks check-in rejected and dependent check-out is rejected',
    () async {
      await repo.enqueueEvent(
        event(id: 'in', type: AttendanceEventType.checkIn),
      );
      await repo.enqueueEvent(
        event(id: 'out', type: AttendanceEventType.checkOut),
      );

      api.nextError = const ServerException(
        'Attendance already exists for this day.',
        statusCode: 409,
      );

      final result = await engine.sync(force: true);
      expect(result.rejectedCount, 2);

      final outbox = await db.getOutboxForDate('2026-11-17');
      expect(outbox.every((e) => e.status == OutboxStatus.rejected), isTrue);
      expect(outbox.last.rejectReason, 'Depends on a rejected check-in');
    },
  );
}
