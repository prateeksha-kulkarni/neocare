import 'package:flutter/material.dart';
import '../screens/health_stat_screen.dart';
import '../screens/activity_stat_screen.dart';
import 'fragment_stats.dart';
import '../screens/edit_profile_screen.dart';
import 'fragment_logs.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _fragments = [
    const FragmentHome(), // Custom dashboard with tiles
    const FragmentStats(),
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

/// Home fragment with Baby Profile + 2 tiles
class FragmentHome extends StatelessWidget {
  const FragmentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            DashboardTile(
              title: 'Health Stat',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HealthStatScreen()),
              ),
            ),
            const SizedBox(height: 16),
            DashboardTile(
              title: 'Activity Stat',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ActivityStatScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tile showing baby profile (without image)
class BabyProfileTile extends StatelessWidget {
  const BabyProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Baby Name: Aryan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Gender: Boy'),
            Text('Date of Birth: Jan 15, 2024'),
            Text('Child ID: SC40132'),
          ],
        ),
      ),
    );
  }
}

/// Common tile for dashboard navigation
class DashboardTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DashboardTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
