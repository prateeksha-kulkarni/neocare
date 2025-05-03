import 'package:flutter/material.dart';
import '../utils/api_service.dart';
import '../utils/app_colors.dart';

class ExternalTempTile extends StatefulWidget {
  const ExternalTempTile({super.key});

  @override
  State<ExternalTempTile> createState() => _ExternalTempTileState();
}

class _ExternalTempTileState extends State<ExternalTempTile> {
  double? extTemp;
  String? timestamp;

  @override
  void initState() {
    super.initState();
    fetchLatestExternalTemp().then((data) {
      setState(() {
        extTemp = data['external_temperature'];
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
        child: extTemp == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'External Temperature',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '$extTemp °C',
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
