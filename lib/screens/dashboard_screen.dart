import 'package:flutter/material.dart';
import '../widgets/health_tile.dart';
import 'fragment_home.dart';
import 'fragment_stats.dart';
import 'fragment_settings.dart';
import 'fragment_logs.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _fragments = [
    const FragmentHome(),
    const FragmentStats(),
    const FragmentSettings(),
    const FragmentLogs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fragments[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: ''),
        ],
      ),
    );
  }
}
