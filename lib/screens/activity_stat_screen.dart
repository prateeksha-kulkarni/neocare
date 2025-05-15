import 'package:flutter/material.dart';
import '../widgets/intrusion_tile.dart';
import '../widgets/safe_sleep_tile.dart';
import '../widgets/emotion_tile.dart';

class ActivityStatScreen extends StatelessWidget {
  const ActivityStatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activity Stats')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          IntrusionTile(),
          SafeSleepTile(),
          EmotionTile(),
        ],
      ),
    );
  }
}
