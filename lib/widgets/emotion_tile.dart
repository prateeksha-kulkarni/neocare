import 'package:flutter/material.dart';
import '../utils/api_service.dart';
import '../utils/app_colors.dart';

class EmotionTile extends StatefulWidget {
  const EmotionTile({super.key});

  @override
  State<EmotionTile> createState() => _EmotionTileState();
}

class _EmotionTileState extends State<EmotionTile> {
  String? emotion;
  String? timestamp;

  @override
  void initState() {
    super.initState();
    fetchLatestEmotionStatus().then((data) {
      setState(() {
        emotion = data['emotion'];
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
        child: emotion == null
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Infant Emotion', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('No data', style: TextStyle(fontSize: 20, color: AppColors.primary)),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Infant Emotion', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              emotion!,
              style: const TextStyle(fontSize: 20, color: AppColors.primary),
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
