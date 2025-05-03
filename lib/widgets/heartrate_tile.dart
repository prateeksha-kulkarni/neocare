import 'package:flutter/material.dart';
import '../utils/api_service.dart'; // Make sure your API service has a method for heart rate.
import '../utils/app_colors.dart';

class HeartRateTile extends StatefulWidget {
  const HeartRateTile({super.key});

  @override
  State<HeartRateTile> createState() => _HeartRateTileState();
}

class _HeartRateTileState extends State<HeartRateTile> {
  double? heartRate;
  String? timestamp;

  @override
  void initState() {
    super.initState();
    fetchLatestHeartRate().then((data) {
      setState(() {
        heartRate = data['heart_rate_bpm']?.toDouble();
        timestamp = data['timestamp'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: heartRate == null
            ? Column(
          children: [
            const Text(
              'Heart Rate',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'No data',
              style: TextStyle(fontSize: 20, color: AppColors.primary),
            ),
            const SizedBox(height: 6),
            Text(
              timestamp != null ? 'Updated: $timestamp' : '',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Heart Rate',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '$heartRate bpm',
              style: const TextStyle(fontSize: 24, color: AppColors.primary),
            ),
            const SizedBox(height: 6),
            Text(
              'Updated: $timestamp',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
