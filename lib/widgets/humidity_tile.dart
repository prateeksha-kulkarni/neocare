import 'package:flutter/material.dart';
import '../utils/api_service.dart';
import '../utils/app_colors.dart';


class HumidityTile extends StatefulWidget {
  const HumidityTile({super.key});

  @override
  State<HumidityTile> createState() => _HumidityTileState();
}

class _HumidityTileState extends State<HumidityTile> {
  double? humidity;
  String? timestamp;

  @override
  void initState() {
    super.initState();
    fetchLatestHumidity().then((data) {
      setState(() {
        humidity = data['humidity_percent'];
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
        child: humidity == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Humidity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '$humidity %',
              style: const TextStyle(fontSize: 24, color: AppColors.primary),
            ),
            const SizedBox(height: 6),
            Text(
              'Updated: $timestamp',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
