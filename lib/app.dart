import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/attendance/presentation/attendance_history_screen.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';
import 'features/leave/presentation/leave_list_screen.dart';
import 'features/sync/presentation/sync_providers.dart';

class RebsApp extends ConsumerWidget {
  const RebsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(syncControllerProvider);

    return MaterialApp(
      title: 'REBS HRMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  static const _pages = [
    DashboardScreen(),
    AttendanceHistoryScreen(),
    LeaveListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(index: _index, children: _pages),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fingerprint_outlined),
            selectedIcon: Icon(Icons.fingerprint),
            label: 'Attendance',
          ),
          NavigationDestination(
            icon: Icon(Icons.beach_access_outlined),
            selectedIcon: Icon(Icons.beach_access),
            label: 'Leave',
          ),
        ],
      ),
    );
  }
}
