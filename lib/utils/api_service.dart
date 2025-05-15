import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://bafsuznk43.execute-api.us-east-1.amazonaws.com/prod/sensordatav7';

Future<Map<String, dynamic>> fetchLatestGasConcentration() async {
  return await _fetchData('gas_concentration_ppm');
}

Future<Map<String, dynamic>> fetchLatestHeartRate() async {
  return await _fetchData('heart_rate_bpm');
}

Future<Map<String, dynamic>> fetchLatestExternalTemp() async {
  return await _fetchData('external_temperature');
}

Future<Map<String, dynamic>> fetchLatestInternalTemp() async {
  return await _fetchData('internal_temperature');
}

Future<Map<String, dynamic>> fetchLatestHumidity() async {
  return await _fetchData('humidity_percent');
}

Future<Map<String, dynamic>> fetchLatestIntrusionStatus() async {
  return await _fetchData('intrusion_detected');
}

Future<Map<String, dynamic>> fetchLatestSafeSleepStatus() async {
  return await _fetchData('safe_sleep');
}

Future<Map<String, dynamic>> fetchLatestEmotionStatus() async {
  return await _fetchData('emotion');
}

Future<Map<String, dynamic>> _fetchData(String key) async {
  try {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        final latest = data.last;
        final payload = latest['payload'];
        return {
          key: payload[key],
          'timestamp': payload['timestamp']
        };
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Fetch error: $e');
  }

  return {key: null, 'timestamp': null};
}
