import 'package:flutter/material.dart';

import '../../../attendance/domain/models/attendance_event.dart';

class SyncBadgeChip extends StatelessWidget {
  const SyncBadgeChip({super.key, required this.badge, this.reason});

  final SyncBadge badge;
  final String? reason;

  @override
  Widget build(BuildContext context) {
    final (label, color, icon) = switch (badge) {
      SyncBadge.pending => (
        'Pending Sync',
        Colors.orange,
        Icons.cloud_upload_outlined,
      ),
      SyncBadge.synced => (
        'Synced',
        Colors.green,
        Icons.cloud_done_outlined,
      ),
      SyncBadge.rejected => (
        'Rejected',
        Colors.red,
        Icons.error_outline,
      ),
    };

    return Tooltip(
      message: reason ?? label,
      child: Chip(
        visualDensity: VisualDensity.compact,
        avatar: Icon(icon, size: 16, color: color),
        label: Text(
          badge == SyncBadge.rejected && reason != null && reason!.isNotEmpty
              ? 'Rejected'
              : label,
          style: TextStyle(color: color, fontSize: 12),
        ),
        side: BorderSide(color: color.withValues(alpha: 0.4)),
        backgroundColor: color.withValues(alpha: 0.08),
      ),
    );
  }
}
