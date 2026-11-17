import 'package:flutter_test/flutter_test.dart';
import 'package:rebs_hrms/core/time/company_clock.dart';
import 'package:timezone/data/latest.dart' as tzdata;

void main() {
  setUpAll(tzdata.initializeTimeZones);

  test('todayCompanyDate uses company timezone, not UTC date alone', () {
    // 2026-11-16 20:30 UTC == 2026-11-17 02:00 Asia/Kolkata
    final clock = FakeCompanyClock(
      fixedUtc: DateTime.utc(2026, 11, 16, 20, 30),
      timezoneId: 'Asia/Kolkata',
    );
    expect(clock.todayCompanyDate(), '2026-11-17');
  });

  test('todayCompanyDate stays previous day just before Kolkata midnight', () {
    // 2026-11-16 18:00 UTC == 2026-11-16 23:30 Asia/Kolkata
    final clock = FakeCompanyClock(
      fixedUtc: DateTime.utc(2026, 11, 16, 18, 0),
      timezoneId: 'Asia/Kolkata',
    );
    expect(clock.todayCompanyDate(), '2026-11-16');
  });
}
