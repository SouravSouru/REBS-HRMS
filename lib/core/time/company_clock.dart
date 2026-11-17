import 'package:timezone/timezone.dart' as tz;

abstract class CompanyClock {
  DateTime nowUtc();
  String todayCompanyDate();
}

class SystemCompanyClock implements CompanyClock {
  SystemCompanyClock(this.timezoneId);

  final String timezoneId;

  tz.Location get _location => tz.getLocation(timezoneId);

  @override
  DateTime nowUtc() => DateTime.now().toUtc();

  @override
  String todayCompanyDate() {
    final local = tz.TZDateTime.from(nowUtc(), _location);
    return formatDate(local);
  }

  static String formatDate(DateTime d) {
    final y = d.year.toString().padLeft(4, '0');
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '$y-$m-$day';
  }
}

class FakeCompanyClock implements CompanyClock {
  FakeCompanyClock({required this.fixedUtc, required this.timezoneId});

  DateTime fixedUtc;
  final String timezoneId;

  @override
  DateTime nowUtc() => fixedUtc.toUtc();

  @override
  String todayCompanyDate() {
    final local = tz.TZDateTime.from(
      nowUtc(),
      tz.getLocation(timezoneId),
    );
    return SystemCompanyClock.formatDate(local);
  }
}
