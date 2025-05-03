import 'package:flutter/material.dart';
import '../utils/api_service.dart';
import '../utils/app_colors.dart';

class InternalTempTile extends StatefulWidget {
  const InternalTempTile({super.key});

  @override
  State<InternalTempTile> createState() => _InternalTempTileState();
}

class _InternalTempTileState extends State<InternalTempTile> {
  double? intTemp;
  String? timestamp;

  @override
  void initState() {
    super.initState();
    fetchLatestInternalTemp().then((data) {
      setState(() {
        intTemp = data['internal_temperature'];
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
        child: intTemp == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Internal Temperature',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '$intTemp °C',
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
