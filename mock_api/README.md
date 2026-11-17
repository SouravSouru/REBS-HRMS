# REBS HRMS Mock API

In-memory Express server for the Flutter take-home. No database; state resets on process restart or `POST /admin/reset`.

## Run

```bash
cd mock_api
npm install
npm start
```

Listens on `http://localhost:3000`. Android emulator clients should use `http://10.0.2.2:3000`.

## Endpoints

| Method | Path | Notes |
|--------|------|--------|
| GET | `/employee/me` | Employee profile + office geofence |
| GET | `/attendance?month=YYYY-MM` | Attendance records |
| POST | `/attendance/events` | Idempotent by `eventId` / `Idempotency-Key` |
| GET | `/leave/balance` | Casual / sick balances |
| GET | `/leave/requests` | Cached leave list |
| POST | `/leave/requests` | Create leave request |
| GET/POST | `/admin/scenario` | Read / switch failure mode |
| POST | `/admin/reset` | Clear attendance, leave, and events |

## Scenarios

```bash
# success (default)
curl -X POST http://localhost:3000/admin/scenario -H "Content-Type: application/json" -d "{\"scenario\":\"success\"}"

# slow (3–5 s delay before response)
curl -X POST http://localhost:3000/admin/scenario -H "Content-Type: application/json" -d "{\"scenario\":\"slow\"}"

# timeout (event is saved, response never sent)
curl -X POST http://localhost:3000/admin/scenario -H "Content-Type: application/json" -d "{\"scenario\":\"timeout\"}"

# server_error (500)
curl -X POST http://localhost:3000/admin/scenario -H "Content-Type: application/json" -d "{\"scenario\":\"server_error\"}"

# duplicate_conflict (409 attendance already exists)
curl -X POST http://localhost:3000/admin/scenario -H "Content-Type: application/json" -d "{\"scenario\":\"duplicate_conflict\"}"

# leave_rejection (422 on POST /leave/requests)
curl -X POST http://localhost:3000/admin/scenario -H "Content-Type: application/json" -d "{\"scenario\":\"leave_rejection\"}"
```

## Example check-in

```bash
curl -X POST http://localhost:3000/attendance/events \
  -H "Content-Type: application/json" \
  -H "Idempotency-Key: 11111111-1111-4111-8111-111111111111" \
  -d "{\"eventId\":\"11111111-1111-4111-8111-111111111111\",\"type\":\"checkIn\",\"companyDate\":\"2026-11-17\",\"occurredAt\":\"2026-11-17T04:30:00.000Z\",\"latitude\":12.9716,\"longitude\":77.5946}"
```

Replay the same `eventId` to confirm idempotency returns the original record without creating a duplicate.
