import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HealthTile extends StatefulWidget {
  final String title;
  final String apiKey;

  const HealthTile({super.key, required this.title, required this.apiKey});

  @override
  State<HealthTile> createState() => _HealthTileState();
}

class _HealthTileState extends State<HealthTile> {
  String value = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final uri = Uri.parse('http://192.168.29.31:3000/data');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          value = data[widget.apiKey]?.toString() ?? 'N/A';
        });
      } else {
        setState(() => value = 'Error');
      }
    } catch (e) {
      setState(() => value = 'Offline');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.health_and_safety, color: Colors.purple),
          const SizedBox(height: 8),
          Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
