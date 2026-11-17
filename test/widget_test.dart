import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rebs_hrms/features/attendance/domain/models/attendance_event.dart';
import 'package:rebs_hrms/features/dashboard/presentation/widgets/sync_badge_chip.dart';

void main() {
  testWidgets('pending sync badge shows label and icon', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SyncBadgeChip(badge: SyncBadge.pending)),
      ),
    );

    expect(find.text('Pending Sync'), findsOneWidget);
    expect(find.byIcon(Icons.cloud_upload_outlined), findsOneWidget);
  });

  testWidgets('rejected badge is distinguishable', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SyncBadgeChip(
            badge: SyncBadge.rejected,
            reason: 'Attendance already exists for this day.',
          ),
        ),
      ),
    );

    expect(find.text('Rejected'), findsOneWidget);
    expect(find.byIcon(Icons.error_outline), findsOneWidget);
  });
}
