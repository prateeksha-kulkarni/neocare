import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart' as styles;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _growthData = [
    {'month': 'Jan', 'weight': 3.5, 'height': 50},
    {'month': 'Feb', 'weight': 4.2, 'height': 54},
    {'month': 'Mar', 'weight': 4.8, 'height': 58},
    {'month': 'Apr', 'weight': 5.3, 'height': 61},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Baby Dashboard', style: styles.AppStyles.heading2),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textDark,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: AppColors.textDark),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: AppColors.textDark),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: styles.AppStyles.screenPadding,
        child: Column(
          children: [
            _buildBabyProfileHeader(),
            const SizedBox(height: 24),
            _buildQuickActionsRow(),
            const SizedBox(height: 24),
            _buildGrowthStatsSection(),
            const SizedBox(height: 24),
            _buildMilestonesSection(),
            const SizedBox(height: 24),
            _buildRecentActivitySection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildBabyProfileHeader() {
    return Container(
      padding: styles.AppStyles.cardPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(styles.AppStyles.borderRadius),
        boxShadow: styles.AppStyles.cardShadow,
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withOpacity(0.1),
              image: const DecorationImage(
                image: NetworkImage('https://images.pexels.com/photos/1620765/pexels-photo-1620765.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Emma Johnson', style: styles.AppStyles.heading2),
                const SizedBox(height: 4),
                Text('6 months old', style: styles.AppStyles.bodyText),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.cake, size: 16, color: AppColors.textLight),
                    const SizedBox(width: 4),
                    Text('Born: April 12, 2023', style: styles.AppStyles.bodyText),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildQuickActionButton(Icons.local_dining, 'Feed'),
        _buildQuickActionButton(Icons.bedtime, 'Sleep'),
        _buildQuickActionButton(Icons.medical_services, 'Medication'),
        _buildQuickActionButton(Icons.child_friendly, 'Diaper'),
      ],
    );
  }

  Widget _buildQuickActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: styles.AppStyles.bodyText),
      ],
    );
  }

  Widget _buildGrowthStatsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Growth Stats', style: styles.AppStyles.heading2),
        const SizedBox(height: 16),
        Container(
          padding: styles.AppStyles.cardPadding,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(styles.AppStyles.borderRadius),
            boxShadow: styles.AppStyles.cardShadow,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard('Weight', '5.3 kg', '+0.5 kg', Icons.monitor_weight, AppColors.primary),
                  _buildStatCard('Height', '61 cm', '+3 cm', Icons.height, AppColors.secondary),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard('Head Circ.', '40 cm', '+1 cm', Icons.face, AppColors.accent),
                  _buildStatCard('BMI', '14.2', 'Healthy', Icons.show_chart, AppColors.success),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String change, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: styles.AppStyles.cardPadding,
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(styles.AppStyles.borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 16, color: color),
                ),
                const Spacer(),
                Text(change, style: styles.AppStyles.bodyText.copyWith(color: color)),
              ],
            ),
            const SizedBox(height: 8),
            Text(title, style: styles.AppStyles.bodyText.copyWith(color: AppColors.textLight)),
            const SizedBox(height: 4),
            Text(value, style: styles.AppStyles.heading2.copyWith(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  Widget _buildMilestonesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Milestones', style: styles.AppStyles.heading2),
            TextButton(
              onPressed: () {},
              child: Text('View All', style: styles.
              AppStyles.bodyText.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildMilestoneCard('First Smile', '2 months', true),
              const SizedBox(width: 12),
              _buildMilestoneCard('Rolling Over', '4 months', true),
              const SizedBox(width: 12),
              _buildMilestoneCard('Sitting Up', 'Coming soon', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMilestoneCard(String title, String subtitle, bool achieved) {
    return Container(
      width: 160,
      padding: styles.AppStyles.cardPadding,
      decoration: BoxDecoration(
        color: achieved ? AppColors.primary.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(styles.AppStyles.borderRadius),
        border: Border.all(
          color: achieved ? AppColors.primary : AppColors.textLight.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: achieved ? AppColors.primary : AppColors.textLight.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              achieved ? Icons.check : Icons.hourglass_empty,
              color: achieved ? Colors.white : AppColors.textLight,
            ),
          ),
          const SizedBox(height: 16),
          Text(title, style: styles.AppStyles.heading3),
          const SizedBox(height: 4),
          Text(subtitle, style: styles.AppStyles.bodyText),
        ],
      ),
    );
  }

  Widget _buildRecentActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Activity', style: styles.AppStyles.heading2),
            TextButton(
              onPressed: () {},
              child: Text('View All', style: styles.AppStyles.bodyText.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            _buildActivityItem('Feeding', '30 min ago', Icons.local_dining),
            const SizedBox(height: 12),
            _buildActivityItem('Sleep', '2 hours ago', Icons.bedtime),
            const SizedBox(height: 12),
            _buildActivityItem('Diaper Change', '3 hours ago', Icons.child_friendly),
          ],
        ),
      ],
    );
  }

  Widget _buildActivityItem(String title, String time, IconData icon) {
    return Container(
      padding: styles.AppStyles.cardPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(styles.AppStyles.borderRadius),
        boxShadow: styles.AppStyles.cardShadow,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: styles.AppStyles.heading3.copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                Text(time, style: styles.AppStyles.bodyText),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.textLight),
        ],
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: _currentIndex == 0 ? AppColors.primary : AppColors.textLight),
            onPressed: () => setState(() => _currentIndex = 0),
          ),
          IconButton(
            icon: Icon(Icons.insights, color: _currentIndex == 1 ? AppColors.primary : AppColors.textLight),
            onPressed: () => setState(() => _currentIndex = 1),
          ),
          const SizedBox(width: 40), // Space for FAB
          IconButton(
            icon: Icon(Icons.event_note, color: _currentIndex == 2 ? AppColors.primary : AppColors.textLight),
            onPressed: () => setState(() => _currentIndex = 2),
          ),
          IconButton(
            icon: Icon(Icons.settings, color: _currentIndex == 3 ? AppColors.primary : AppColors.textLight),
            onPressed: () => setState(() => _currentIndex = 3),
          ),
        ],
      ),
    );
  }
}