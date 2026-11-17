import 'dart:async';

import 'package:flutter/material.dart';

class ElapsedDurationText extends StatefulWidget {
  const ElapsedDurationText({
    super.key,
    required this.checkInAt,
    this.checkOutAt,
  });

  final DateTime checkInAt;
  final DateTime? checkOutAt;

  @override
  State<ElapsedDurationText> createState() => _ElapsedDurationTextState();
}

class _ElapsedDurationTextState extends State<ElapsedDurationText> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.checkOutAt == null) {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void didUpdateWidget(covariant ElapsedDurationText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.checkOutAt != null) {
      _timer?.cancel();
      _timer = null;
    } else {
      _timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final end = widget.checkOutAt ?? DateTime.now().toUtc();
    final elapsed = end.difference(widget.checkInAt.toUtc());
    final hours = elapsed.inHours;
    final minutes = elapsed.inMinutes.remainder(60);
    final seconds = elapsed.inSeconds.remainder(60);
    final text =
        '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
    return Text(text, style: Theme.of(context).textTheme.titleMedium);
  }
}
