import 'package:flutter/material.dart';
import '../widgets/gas_tile.dart';
import '../widgets/heartrate_tile.dart';
import '../widgets/external_temp_tile.dart';
import '../widgets/internal_temp_tile.dart';
import '../widgets/humidity_tile.dart';

class HealthStatScreen extends StatelessWidget {
  const HealthStatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Stats')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          GasTile(),
          HeartRateTile(),
          ExternalTempTile(),
          InternalTempTile(),
          HumidityTile(),
        ],
      ),
    );
  }
}
