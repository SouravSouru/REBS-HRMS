'use strict';

const express = require('express');
const cors = require('cors');
const { randomUUID } = require('crypto');

const PORT = process.env.PORT || 3000;
const OFFICE = {
  lat: Number(process.env.OFFICE_LAT || 12.9716),
  lng: Number(process.env.OFFICE_LNG || 77.5946),
  radiusMeters: Number(process.env.RADIUS_METERS || 200),
};

const SCENARIOS = [
  'success',
  'slow',
  'timeout',
  'server_error',
  'duplicate_conflict',
  'leave_rejection',
];

function haversineMeters(lat1, lng1, lat2, lng2) {
  const toRad = (d) => (d * Math.PI) / 180;
  const R = 6371000;
  const dLat = toRad(lat2 - lat1);
  const dLng = toRad(lng2 - lng1);
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLng / 2) ** 2;
  return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}

function companyToday() {
  // Asia/Kolkata for the assignment default.
  return new Date().toLocaleDateString('en-CA', {
    timeZone: 'Asia/Kolkata',
  });
}

function createState() {
  return {
    scenario: 'success',
    employee: {
      id: 'EMP-1001',
      name: 'Sourav K K',
      department: 'Engineering',
      officeLat: OFFICE.lat,
      officeLng: OFFICE.lng,
      radiusMeters: OFFICE.radiusMeters,
      timezone: 'Asia/Kolkata',
    },
    // eventId -> stored event / attendance side-effect
    eventsById: new Map(),
    // companyDate -> { checkIn, checkOut, recordId }
    attendanceByDate: new Map(),
    leaveBalance: { casual: 8, sick: 5 },
    leaveRequests: [],
  };
}

let state = createState();

const app = express();
app.use(cors());
app.use(express.json());

app.use((req, res, next) => {
  console.log(`${req.method} ${req.path}`);
  next();
});

async function applyScenarioDelay(res) {
  if (state.scenario === 'slow') {
    const ms = 3000 + Math.floor(Math.random() * 2000);
    await new Promise((r) => setTimeout(r, ms));
  }
  if (state.scenario === 'timeout') {
    // Accept the write path below, then hang so the client times out.
    return 'timeout';
  }
  if (state.scenario === 'server_error') {
    res.status(500).json({ message: 'Simulated server error.' });
    return 'responded';
  }
  return 'continue';
}

app.get('/employee/me', (req, res) => {
  res.json(state.employee);
});

app.get('/attendance', (req, res) => {
  const month = req.query.month; // YYYY-MM
  const records = [];
  for (const [companyDate, row] of state.attendanceByDate.entries()) {
    if (month && !companyDate.startsWith(month)) continue;
    records.push({
      id: row.recordId,
      companyDate,
      checkInAt: row.checkIn?.occurredAt ?? null,
      checkOutAt: row.checkOut?.occurredAt ?? null,
      checkInLat: row.checkIn?.latitude ?? null,
      checkInLng: row.checkIn?.longitude ?? null,
      checkOutLat: row.checkOut?.latitude ?? null,
      checkOutLng: row.checkOut?.longitude ?? null,
    });
  }
  records.sort((a, b) => b.companyDate.localeCompare(a.companyDate));
  res.json({ records });
});

app.post('/attendance/events', async (req, res) => {
  const body = req.body || {};
  const eventId =
    body.eventId || req.get('Idempotency-Key') || req.get('idempotency-key');

  if (!eventId) {
    return res.status(400).json({ message: 'eventId is required.' });
  }

  // Idempotent replay: same eventId always returns the first result.
  if (state.eventsById.has(eventId)) {
    const existing = state.eventsById.get(eventId);
    return res.status(200).json(existing.response);
  }

  const scenarioGate = await applyScenarioDelay(res);
  if (scenarioGate === 'responded') return;

  const type = body.type;
  const companyDate = body.companyDate || companyToday();
  const latitude = Number(body.latitude);
  const longitude = Number(body.longitude);
  const occurredAt = body.occurredAt || new Date().toISOString();

  if (!['checkIn', 'checkOut'].includes(type)) {
    return res.status(400).json({ message: 'type must be checkIn or checkOut.' });
  }
  if (Number.isNaN(latitude) || Number.isNaN(longitude)) {
    return res.status(400).json({ message: 'latitude and longitude are required.' });
  }

  const distance = haversineMeters(
    latitude,
    longitude,
    state.employee.officeLat,
    state.employee.officeLng,
  );
  if (distance > state.employee.radiusMeters) {
    return res.status(422).json({
      message: `You're ${Math.round(distance)} m away from the office. Move within ${Math.round(state.employee.radiusMeters)} m to check in.`,
    });
  }

  let day = state.attendanceByDate.get(companyDate);
  if (!day) {
    day = { recordId: randomUUID(), checkIn: null, checkOut: null };
    state.attendanceByDate.set(companyDate, day);
  }

  if (state.scenario === 'duplicate_conflict' && type === 'checkIn' && !day.checkIn) {
    // Pretend another client already checked in under a different eventId.
    day.checkIn = {
      eventId: randomUUID(),
      occurredAt,
      latitude,
      longitude,
    };
  }

  if (type === 'checkIn') {
    if (day.checkIn) {
      return res.status(409).json({
        message: 'Attendance already exists for this day.',
        code: 'ATTENDANCE_EXISTS',
      });
    }
    day.checkIn = { eventId, occurredAt, latitude, longitude };
  } else {
    if (!day.checkIn) {
      return res.status(422).json({
        message: 'Check out requires a check-in for this day.',
      });
    }
    if (day.checkOut) {
      return res.status(409).json({
        message: 'Check-out already exists for this day.',
        code: 'ATTENDANCE_EXISTS',
      });
    }
    day.checkOut = { eventId, occurredAt, latitude, longitude };
  }

  const response = {
    id: day.recordId,
    eventId,
    type,
    companyDate,
    occurredAt,
    distanceFromOfficeMeters: Math.round(distance),
  };

  state.eventsById.set(eventId, { response, dayKey: companyDate });

  if (scenarioGate === 'timeout') {
    // Event is persisted; client never gets a response.
    return;
  }

  return res.status(201).json(response);
});

app.get('/leave/balance', (req, res) => {
  res.json(state.leaveBalance);
});

app.get('/leave/requests', (req, res) => {
  res.json({ requests: state.leaveRequests });
});

function leaveDays(startDate, endDate) {
  const start = new Date(startDate);
  const end = new Date(endDate);
  return Math.floor((end - start) / 86400000) + 1;
}

function overlaps(aStart, aEnd, bStart, bEnd) {
  return aStart <= bEnd && bStart <= aEnd;
}

app.post('/leave/requests', (req, res) => {
  if (state.scenario === 'leave_rejection') {
    return res.status(422).json({
      message: 'Leave request rejected by policy simulation.',
    });
  }
  if (state.scenario === 'server_error') {
    return res.status(500).json({ message: 'Simulated server error.' });
  }

  const { type, startDate, endDate, reason } = req.body || {};
  if (!['casual', 'sick'].includes(type)) {
    return res.status(400).json({ message: 'type must be casual or sick.' });
  }
  if (!startDate || !endDate) {
    return res.status(400).json({ message: 'startDate and endDate are required.' });
  }
  if (endDate < startDate) {
    return res.status(422).json({ message: 'End date cannot be before start date.' });
  }
  const today = companyToday();
  if (startDate < today) {
    return res.status(422).json({ message: 'Start date cannot be before today.' });
  }
  const trimmed = (reason || '').replace(/\s+/g, '');
  if (trimmed.length < 10) {
    return res.status(422).json({
      message: 'Reason must contain at least 10 non-whitespace characters.',
    });
  }

  const days = leaveDays(startDate, endDate);
  const available = state.leaveBalance[type];
  if (days > available) {
    return res.status(422).json({
      message: `Requested ${days} day(s) exceeds ${type} balance of ${available}.`,
    });
  }

  const blocking = state.leaveRequests.filter(
    (r) => r.status === 'pending' || r.status === 'approved',
  );
  for (const existing of blocking) {
    if (overlaps(startDate, endDate, existing.startDate, existing.endDate)) {
      return res.status(422).json({
        message: 'This request overlaps an existing pending or approved leave.',
      });
    }
  }

  const created = {
    id: randomUUID(),
    type,
    startDate,
    endDate,
    reason,
    status: 'pending',
    days,
  };
  state.leaveRequests.unshift(created);
  state.leaveBalance[type] = available - days;
  return res.status(201).json(created);
});

app.get('/admin/scenario', (req, res) => {
  res.json({ scenario: state.scenario, available: SCENARIOS });
});

app.post('/admin/scenario', (req, res) => {
  const scenario = req.body?.scenario;
  if (!SCENARIOS.includes(scenario)) {
    return res.status(400).json({
      message: `Unknown scenario. Use one of: ${SCENARIOS.join(', ')}`,
    });
  }
  state.scenario = scenario;
  res.json({ scenario: state.scenario });
});

app.post('/admin/reset', (req, res) => {
  const keepScenario = state.scenario;
  state = createState();
  state.scenario = keepScenario;
  res.json({ ok: true, scenario: state.scenario });
});

app.listen(PORT, () => {
  console.log(`REBS mock API on http://localhost:${PORT}`);
  console.log(`Office: ${OFFICE.lat}, ${OFFICE.lng} radius ${OFFICE.radiusMeters}m`);
  console.log(`Scenario: ${state.scenario}`);
});
