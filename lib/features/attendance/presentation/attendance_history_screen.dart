import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../dashboard/presentation/widgets/sync_badge_chip.dart';
import 'providers/attendance_providers.dart';

class AttendanceHistoryScreen extends ConsumerWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentAsync = ref.watch(recentAttendanceProvider);
    final outboxAsync = ref.watch(outboxEntriesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      body: recentAsync.when(
        data: (records) {
          if (records.isEmpty) {
            return const Center(child: Text('No attendance records yet.'));
          }
          final outbox = outboxAsync.asData?.value ?? [];
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: records.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final record = records[index];
              final dayOutbox = outbox
                  .where((e) => e.companyDate == record.companyDate)
                  .toList();
              final pendingOrRejected = dayOutbox.where(
                (e) => e.status.name != 'synced',
              );
              final badge = pendingOrRejected.isEmpty
                  ? (dayOutbox.isEmpty ? null : dayOutbox.last.status)
                  : pendingOrRejected.last.status;
              final reason = dayOutbox
                  .where((e) => e.rejectReason != null)
                  .map((e) => e.rejectReason!)
                  .lastOrNull;

              return ListTile(
                title: Text(record.companyDate),
                subtitle: Text(
                  [
                    if (record.checkInAt != null)
                      'In ${DateFormat.Hm().format(record.checkInAt!.toLocal())}',
                    if (record.checkOutAt != null)
                      'Out ${DateFormat.Hm().format(record.checkOutAt!.toLocal())}',
                    ?reason,
                  ].join('\n'),
                ),
                isThreeLine: reason != null,
                trailing: badge == null
                    ? null
                    : SyncBadgeChip(badge: badge, reason: reason),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
      ),
    );
  }
}
