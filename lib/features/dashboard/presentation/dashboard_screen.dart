import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/error/app_exception.dart';
import '../../../core/location/debug_location_override.dart';
import '../../../core/providers/core_providers.dart';
import '../../attendance/domain/models/day_attendance_state.dart';
import '../../attendance/presentation/attendance_action_notifier.dart';
import '../../attendance/presentation/providers/attendance_providers.dart';
import '../../leave/presentation/providers/leave_providers.dart';
import '../../sync/presentation/sync_providers.dart';
import 'widgets/elapsed_duration_text.dart';
import 'widgets/sync_badge_chip.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeAsync = ref.watch(employeeProvider);
    final todayAsync = ref.watch(todayAttendanceProvider);
    final recentAsync = ref.watch(recentAttendanceProvider);
    final balanceAsync = ref.watch(leaveBalanceProvider);
    final pendingAsync = ref.watch(pendingOutboxCountProvider);
    final syncState = ref.watch(syncControllerProvider);
    final actionState = ref.watch(attendanceActionNotifierProvider);
    final outboxAsync = ref.watch(outboxEntriesProvider);

    ref.listen(attendanceActionNotifierProvider, (prev, next) {
      final message = next.errorMessage;
      if (message == null || message == prev?.errorMessage) return;
      _showActionFeedback(context, ref, next);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('REBS'),
        actions: [
          if (!kReleaseMode)
            PopupMenuButton<DebugLocationPreset?>(
              tooltip: 'Debug location',
              icon: const Icon(Icons.my_location),
              onSelected: (preset) {
                ref.read(debugLocationOverrideProvider).preset = preset;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      preset == null
                          ? 'Using device GPS'
                          : 'Debug location: ${preset.name}',
                    ),
                  ),
                );
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: null, child: Text('Device GPS')),
                const PopupMenuItem(
                  value: DebugLocationPreset.atOffice,
                  child: Text('At office'),
                ),
                const PopupMenuItem(
                  value: DebugLocationPreset.nearby300m,
                  child: Text('300 m away'),
                ),
                const PopupMenuItem(
                  value: DebugLocationPreset.farAway,
                  child: Text('Far away'),
                ),
              ],
            ),
          IconButton(
            tooltip: 'Sync now',
            onPressed: syncState.isSyncing
                ? null
                : () => ref.read(syncControllerProvider.notifier).syncNow(),
            icon: syncState.isSyncing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.sync),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(syncControllerProvider.notifier).refreshCaches();
          await ref.read(syncControllerProvider.notifier).syncNow();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (!syncState.isOnline)
              _Banner(
                color: Colors.orange,
                text:
                    'Offline${pendingAsync.asData != null && pendingAsync.asData!.value > 0 ? ' · ${pendingAsync.asData!.value} pending event(s)' : ''}',
              ),
            if (syncState.errorMessage != null)
              _Banner(
                color: Colors.red,
                text: syncState.errorMessage!,
                actionLabel: 'Retry',
                onAction: () =>
                    ref.read(syncControllerProvider.notifier).refreshCaches(),
              ),
            employeeAsync.when(
              data: (employee) {
                if (employee == null) {
                  return const _EmptyState(
                    title: 'No employee data yet',
                    subtitle: 'Pull to refresh when you are online.',
                  );
                }
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        employee.name.isNotEmpty
                            ? employee.name[0].toUpperCase()
                            : '?',
                      ),
                    ),
                    title: Text(employee.name),
                    subtitle: Text('${employee.id} · ${employee.department}'),
                  ),
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Could not load employee: $e'),
            ),
            const SizedBox(height: 12),
            todayAsync.when(
              data: (today) => _TodayCard(
                today: today,
                isBusy: actionState.isBusy,
                onCheckIn: () => ref
                    .read(attendanceActionNotifierProvider.notifier)
                    .checkIn(),
                onCheckOut: () => ref
                    .read(attendanceActionNotifierProvider.notifier)
                    .checkOut(),
              ),
              loading: () => const Card(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
              error: (e, _) => Text('Today status unavailable: $e'),
            ),
            const SizedBox(height: 12),
            balanceAsync.when(
              data: (balance) => Card(
                child: ListTile(
                  title: const Text('Leave balance'),
                  subtitle: Text(
                    balance == null
                        ? 'Not loaded yet'
                        : 'Casual ${balance.casual.toInt()} · Sick ${balance.sick.toInt()}',
                  ),
                ),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            Text(
              'Recent attendance',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            recentAsync.when(
              data: (records) {
                if (records.isEmpty) {
                  return const Text('No attendance records yet.');
                }
                final outbox = outboxAsync.asData?.value ?? [];
                return Column(
                  children: records.map((record) {
                    final dayOutbox = outbox
                        .where((e) => e.companyDate == record.companyDate)
                        .toList();
                    final badge = dayOutbox.isEmpty
                        ? null
                        : dayOutbox.map((e) => e.status).fold(
                            dayOutbox.first.status,
                            (a, b) {
                              if (a.index > b.index) return a;
                              return b;
                            },
                          );
                    final rejected = dayOutbox
                        .where((e) => e.rejectReason != null)
                        .map((e) => e.rejectReason!)
                        .toList();
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(record.companyDate),
                      subtitle: Text(
                        [
                          if (record.checkInAt != null)
                            'In ${_formatTime(record.checkInAt!)}',
                          if (record.checkOutAt != null)
                            'Out ${_formatTime(record.checkOutAt!)}',
                        ].join(' · '),
                      ),
                      trailing: badge == null
                          ? null
                          : SyncBadgeChip(
                              badge: badge,
                              reason: rejected.isEmpty ? null : rejected.last,
                            ),
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Could not load attendance: $e'),
            ),
          ],
        ),
      ),
    );
  }

  static String _formatTime(DateTime utc) {
    return DateFormat.Hm().format(utc.toLocal());
  }

  static Future<void> _showActionFeedback(
    BuildContext context,
    WidgetRef ref,
    AttendanceActionState state,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final kind = state.locationFailure;
    if (kind == LocationFailureKind.permanentlyDenied) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(state.errorMessage!),
          action: SnackBarAction(
            label: 'Open settings',
            onPressed: () {
              ref.read(locationServiceProvider).openSettings();
            },
          ),
        ),
      );
      return;
    }
    if (kind == LocationFailureKind.servicesDisabled) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(state.errorMessage!),
          action: SnackBarAction(
            label: 'Location settings',
            onPressed: () {
              ref.read(locationServiceProvider).openLocationSettings();
            },
          ),
        ),
      );
      return;
    }
    messenger.showSnackBar(SnackBar(content: Text(state.errorMessage!)));
  }
}

class _TodayCard extends StatelessWidget {
  const _TodayCard({
    required this.today,
    required this.isBusy,
    required this.onCheckIn,
    required this.onCheckOut,
  });

  final DayAttendanceState today;
  final bool isBusy;
  final VoidCallback onCheckIn;
  final VoidCallback onCheckOut;

  @override
  Widget build(BuildContext context) {
    final statusLabel = switch (today.status) {
      TodayStatus.notCheckedIn => 'Not Checked In',
      TodayStatus.checkedIn => 'Checked In',
      TodayStatus.checkedOut => 'Checked Out',
    };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    statusLabel,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (today.syncBadge != null)
                  SyncBadgeChip(
                    badge: today.syncBadge!,
                    reason: today.rejectReason,
                  ),
              ],
            ),
            if (today.rejectReason != null) ...[
              const SizedBox(height: 8),
              Text(
                today.rejectReason!,
                style: TextStyle(color: Colors.red),
              ),
            ],
            const SizedBox(height: 8),
            if (today.checkInAt != null)
              Text(
                'Check-in: ${DashboardScreen._formatTime(today.checkInAt!)}',
              ),
            if (today.checkOutAt != null)
              Text(
                'Check-out: ${DashboardScreen._formatTime(today.checkOutAt!)}',
              ),
            if (today.checkInAt != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Elapsed: '),
                  ElapsedDurationText(
                    checkInAt: today.checkInAt!,
                    checkOutAt: today.checkOutAt,
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            if (today.status == TodayStatus.notCheckedIn)
              FilledButton(
                onPressed: isBusy ? null : onCheckIn,
                child: isBusy
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Check in'),
              ),
            if (today.status == TodayStatus.checkedIn)
              FilledButton(
                onPressed: isBusy ? null : onCheckOut,
                child: isBusy
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Check out'),
              ),
          ],
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({
    required this.color,
    required this.text,
    this.actionLabel,
    this.onAction,
  });

  final Color color;
  final String text;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(text, style: TextStyle(color: color)),
          ),
          if (actionLabel != null && onAction != null)
            TextButton(onPressed: onAction, child: Text(actionLabel!)),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(subtitle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
