import 'package:flutter/material.dart';
import '../utils/api_service.dart';
import '../utils/app_colors.dart';

class IntrusionTile extends StatefulWidget {
  const IntrusionTile({super.key});

  @override
  State<IntrusionTile> createState() => _IntrusionTileState();
}

class _IntrusionTileState extends State<IntrusionTile> {
  String? intrusionStatus; // Now it's a string instead of bool
  String? timestamp;

  @override
  void initState() {
    super.initState();
    fetchLatestIntrusionStatus().then((data) {
      setState(() {
        intrusionStatus = data['intrusion_detected'];  // API now returns a string
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
        child: intrusionStatus == null
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Intrusion Status',
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
              'Intrusion Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              intrusionStatus!,  // Using the string fetched from the API
              style: TextStyle(
                fontSize: 20,
                color: intrusionStatus == 'Intrusion Detected'
                    ? Colors.red
                    : Colors.green,
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
