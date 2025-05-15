import 'package:flutter/material.dart';
import '../utils/api_service.dart';
import '../utils/app_colors.dart';

class SafeSleepTile extends StatefulWidget {
  const SafeSleepTile({super.key});

  @override
  State<SafeSleepTile> createState() => _SafeSleepTileState();
}

class _SafeSleepTileState extends State<SafeSleepTile> {
  bool? isSafeSleep;
  String? timestamp;

  @override
  void initState() {
    super.initState();
    fetchLatestSafeSleepStatus().then((data) {
      setState(() {
        isSafeSleep = data['safe_sleep'] == true;
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
        child: isSafeSleep == null
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Safe Sleep Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'No data',
              style: TextStyle(fontSize: 20, color: AppColors.primary),
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Safe Sleep Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              isSafeSleep! ? 'Safe Sleep Detected' : 'Unsafe Sleep',
              style: TextStyle(
                fontSize: 20,
                color: isSafeSleep! ? Colors.green : Colors.red,
              ),
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
