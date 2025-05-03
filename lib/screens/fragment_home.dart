import 'package:flutter/material.dart';
import '../widgets/gas_tile.dart';
import '../widgets/heartrate_tile.dart';
import '../widgets/external_temp_tile.dart';
import '../widgets/internal_temp_tile.dart';
import '../widgets/humidity_tile.dart';

class FragmentHome extends StatelessWidget {
  const FragmentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
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
