# REBS HRMS

Flutter employee app for the REBS take-home. You can check in / out offline, sync later, and request leave. There’s a small Node mock API in `mock_api/`.

Android / iOS only.

## What it does

- Dashboard: profile, today’s status, elapsed time, leave balance, recent attendance
- Check-in / check-out with geofence (saved locally first, then synced)
- Leave list + request form (needs network to submit)
- Offline banner + Pending / Synced / Rejected badges

## Run

**1. Mock API**

```bash
cd mock_api
npm install
npm start
```

Runs on `http://localhost:3000`.  
Emulator → use `http://10.0.2.2:3000` (already the default in `app_config.dart`).

**2. App config (edit this for testing)**

All app settings are static in `lib/core/config/app_config.dart`:

```dart
static const AppConfig defaults = AppConfig(
  apiBaseUrl: 'http://10.0.2.2:3000', // emulator → host machine
  officeLat: 12.9716,
  officeLng: 77.5946,
  radiusMeters: 200,
  companyTimezone: 'Asia/Kolkata',
);
```

- Emulator: keep `apiBaseUrl` as `http://10.0.2.2:3000`
- Real phone: set `apiBaseUrl` to your PC’s LAN IP (same Wi‑Fi), e.g. `http://192.168.1.10:3000`
- Change office lat/lng, radius, or timezone in that same file, then hot restart / rebuild

**3. App**

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

**4. Tests**

```bash
flutter test
```

## Project layout

```
lib/
  core/         config, dio, clock, connectivity, location
  database/     Drift tables (cache + outbox)
  features/
    dashboard/
    attendance/   UI + rules + repository
    leave/        UI + rules + repository
    sync/         SyncEngine + controller
mock_api/       Express mock server
test/
```

## Stack

- Riverpod (generated providers)
- Drift (SQLite cache + outbox)
- Dio
- connectivity_plus, geolocator, uuid, timezone, intl

## How sync works (short version)

Check-in writes an outbox row with a client `eventId`, then syncs when online.  
Same `eventId` is retried on timeout so we don’t create duplicates.  
Outbox is synced in order (`sequence`). If check-in is rejected, checkout that depends on it gets rejected too.

## Mock scenarios

```bash
curl -X POST http://localhost:3000/admin/scenario \
  -H "Content-Type: application/json" \
  -d "{\"scenario\":\"timeout\"}"
```

Available: `success`, `slow`, `timeout`, `server_error`, `duplicate_conflict`, `leave_rejection`.

More curl examples in `mock_api/README.md`.

## Location for testing

For checking geofence while developing, the dashboard has a **location icon** (debug builds only). Tap it to set:

- At office — inside the radius (check-in works)
- 300 m away — outside
- Far away — far outside
- Device GPS — use real / emulator GPS again

This icon is only for testing. Release builds use real GPS.

Emulator GPS:

```bash
adb emu geo fix 77.5946 12.9716
```

Office defaults match `app_config.dart`: `12.9716, 77.5946`, 200 m radius, timezone `Asia/Kolkata`. Edit that file to change them.

## Demo video

Walkthrough of the app (check-in / out, offline sync, leave):

https://github.com/SouravSouru/REBS-HRMS/raw/main/doc/demo.mp4

<video src="doc/demo.mp4" controls width="720"></video>

## Notes

- One check-in / check-out per company day (no overnight shifts)
- Leave days are inclusive calendar days
- Uninstall clears the local Drift DB. If you still see old attendance after reinstall, the **mock API** still has it — the app downloads it again on launch. Reset with:
  `curl -X POST http://localhost:3000/admin/reset`
  (or restart `npm start`). Also: `adb shell pm clear com.souravkk.rebs_hrms`
- No auth (not in scope)
- Client rules are for UX; a real server would still re-check geofence, duplicates, etc.


