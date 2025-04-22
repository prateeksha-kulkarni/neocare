import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        backgroundColor: Color(0xFF8A9EFF),
        elevation: 0,
        title: const Text(
          'ShishuCare',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBabyDetails(),
            const SizedBox(height: 20),
            _buildChartSection(),
            const SizedBox(height: 20),
            _buildStatusList(),
            const SizedBox(height: 20),
            _buildTipsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBabyDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF8A9EFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Baby Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('ID: 12345 | Age: 6 Months | Gender: Female',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildChartSection() {
    return Column(
      children: [
        _buildChartCard('Heart Rate & SpO₂', ['Heart Rate', 'SpO₂']),
        const SizedBox(height: 16),
        _buildChartCard('Internal Temperature', ['Internal Temp (°C)']),
        const SizedBox(height: 16),
        _buildChartCard('Environment (Temp & Humidity)', ['External Temp', 'Humidity']),
      ],
    );
  }

  Widget _buildChartCard(String title, List<String> labels) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(height: 220, child: _buildSampleChart(labels)),
        ],
      ),
    );
  }

  Widget _buildSampleChart(List<String> labels) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, _) {
                switch (value.toInt()) {
                  case 0:
                    return const Text('12:00');
                  case 1:
                    return const Text('12:10');
                  case 2:
                    return const Text('12:20');
                  case 3:
                    return const Text('12:30');
                  case 4:
                    return const Text('12:40');
                  default:
                    return const Text('');
                }
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 10,
              getTitlesWidget: (value, _) {
                if ([95, 105, 115, 125].contains(value.toInt())) {
                  return Text('${value.toInt()}');
                }
                return const Text('');
              },
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: [const FlSpot(0, 115), const FlSpot(1, 120), const FlSpot(2, 118), const FlSpot(3, 112), const FlSpot(4, 119)],
            isCurved: true,
            color: const Color(0xFF8A9EFF),
            barWidth: 3,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusList() {
    final List<Map<String, dynamic>> statusItems = [
      {'title': 'Actigraphy', 'status': 'Normal', 'icon': Icons.directions_run},
      {'title': 'Safe Sleep', 'status': 'Safe', 'icon': Icons.bedtime},
      {'title': 'Intrusion', 'status': 'None', 'icon': Icons.security},
      {'title': 'Emotion', 'status': 'Happy', 'icon': Icons.emoji_emotions},
      {'title': 'Gas Concentration', 'status': 'Normal', 'icon': Icons.cloud},
      {'title': 'Safety', 'status': 'Good', 'icon': Icons.health_and_safety},
    ];

    return Column(
      children: statusItems
          .map((item) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: _buildStatusCard(item['title'], item['status'], item['icon']),
      ))
          .toList(),
    );
  }

  Widget _buildStatusCard(String title, String status, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF8A9EFF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 2),
                Text('Status: $status',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
        ],
      ),

    );
  }
}
