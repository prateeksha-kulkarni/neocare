import 'package:flutter/material.dart';
import 'dart:async';
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
  bool _dialogShown = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await fetchLatestGasConcentration();
    if (!mounted) return;
    setState(() {
      gasPPM = data['gas_concentration_ppm'];
      timestamp = data['timestamp'];
    });

    if (gasPPM != null && gasPPM! > 80 && !_dialogShown) {
      _dialogShown = true;
      showGasAlertDialog();
    }
  }


  void showGasAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Warning!"),
        content: const Text(
            "High gas concentration detected. Please check the environment."),
        backgroundColor: Colors.red[100],
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
        contentTextStyle: const TextStyle(fontSize: 16),
      ),
    );

    // Auto-dismiss the dialog after 30 seconds
    Future.delayed(const Duration(seconds: 30), () {
      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop(); // Close dialog
      }
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
