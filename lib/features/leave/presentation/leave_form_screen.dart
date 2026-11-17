import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../sync/presentation/sync_providers.dart';
import '../domain/models/leave_models.dart';
import 'leave_form_notifier.dart';

class LeaveFormScreen extends ConsumerWidget {
  const LeaveFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(leaveFormNotifierProvider);
    final sync = ref.watch(syncControllerProvider);
    final online = sync.isOnline;

    return Scaffold(
      appBar: AppBar(title: const Text('Request leave')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (!online)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'You are offline. Leave submission needs a network connection.',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            Text('Type', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            SegmentedButton<LeaveType>(
              segments: const [
                ButtonSegment(value: LeaveType.casual, label: Text('Casual')),
                ButtonSegment(value: LeaveType.sick, label: Text('Sick')),
              ],
              selected: {form.type},
              onSelectionChanged: (value) {
                ref
                    .read(leaveFormNotifierProvider.notifier)
                    .setType(value.first);
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Start date'),
              subtitle: Text(form.startDate),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final picked = await _pickDate(context, form.startDate);
                if (picked != null) {
                  ref
                      .read(leaveFormNotifierProvider.notifier)
                      .setStartDate(picked);
                }
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('End date'),
              subtitle: Text(form.endDate),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final picked = await _pickDate(context, form.endDate);
                if (picked != null) {
                  ref
                      .read(leaveFormNotifierProvider.notifier)
                      .setEndDate(picked);
                }
              },
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Reason',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                helperText: 'At least 10 non-whitespace characters',
              ),
              onChanged: (value) {
                ref.read(leaveFormNotifierProvider.notifier).setReason(value);
              },
            ),
            if (form.errorMessage != null) ...[
              const SizedBox(height: 12),
              Text(
                form.errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ],
            const SizedBox(height: 24),
            FilledButton(
              onPressed: !online || form.isSubmitting
                  ? null
                  : () async {
                      final ok = await ref
                          .read(leaveFormNotifierProvider.notifier)
                          .submit();
                      if (ok && context.mounted) {
                        Navigator.of(context).pop();
                      }
                    },
              child: form.isSubmitting
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(online ? 'Submit' : 'Unavailable offline'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _pickDate(BuildContext context, String current) async {
    final initial = DateTime.tryParse(current) ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked == null) return null;
    final y = picked.year.toString().padLeft(4, '0');
    final m = picked.month.toString().padLeft(2, '0');
    final d = picked.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}
