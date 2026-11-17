import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/leave_models.dart';
import 'leave_form_screen.dart';
import 'providers/leave_providers.dart';

class LeaveListScreen extends ConsumerWidget {
  const LeaveListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestsAsync = ref.watch(leaveRequestsProvider);
    final balanceAsync = ref.watch(leaveBalanceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Leave')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const LeaveFormScreen()));
        },
        icon: const Icon(Icons.add),
        label: const Text('Request'),
      ),
      body: Column(
        children: [
          balanceAsync.when(
            data: (balance) => Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  balance == null
                      ? 'Balance unavailable offline until first sync'
                      : 'Casual ${balance.casual.toInt()} · Sick ${balance.sick.toInt()}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            loading: () => const LinearProgressIndicator(),
            error: (_, _) => const SizedBox.shrink(),
          ),
          Expanded(
            child: requestsAsync.when(
              data: (requests) {
                if (requests.isEmpty) {
                  return const Center(child: Text('No leave requests yet.'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: requests.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ),
                      title: Text(
                        '${_typeLabel(request.type)} · ${request.days.toInt()} day(s)',
                      ),
                      subtitle: Text(
                        '${request.startDate} → ${request.endDate}\n${request.reason}',
                      ),
                      isThreeLine: true,
                      trailing: _StatusChip(status: request.status),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('$e')),
            ),
          ),
        ],
      ),
    );
  }

  String _typeLabel(LeaveType type) => switch (type) {
    LeaveType.casual => 'Casual',
    LeaveType.sick => 'Sick',
  };
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final LeaveStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      LeaveStatus.pending => ('Pending', Colors.orange),
      LeaveStatus.approved => ('Approved', Colors.green),
      LeaveStatus.rejected => ('Rejected', Colors.red),
    };
    return Chip(
      label: Text(label, style: TextStyle(color: color, fontSize: 12)),
      backgroundColor: color.withValues(alpha: 0.08),
      side: BorderSide(color: color.withValues(alpha: 0.4)),
      visualDensity: VisualDensity.compact,
    );
  }
}
