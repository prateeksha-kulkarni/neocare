import 'package:flutter/material.dart';
import '../utils/api_service.dart';
import '../utils/app_colors.dart';

class GasTile extends StatefulWidget {
  const GasTile({super.key});

  @override
  State<GasTile> createState() => _GasTileState();
}

class _GasTileState extends State<GasTile> {
  double? gasPPM;
  String? timestamp;

  @override
  void initState() {
    super.initState();
    fetchLatestGasConcentration().then((data) {
      setState(() {
        gasPPM = data['gas_concentration_ppm'];
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
        child: gasPPM == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gas Concentration',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '$gasPPM ppm',
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
