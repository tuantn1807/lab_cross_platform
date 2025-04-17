import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 9 - Thời tiết',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey[900],
      ),
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _cityController = TextEditingController();
  String _temperature = '';
  String _description = '';
  String _city = '';
  String _error = '';

  final String apiKey = '9ab2d6b879ff659f7a72c175e5feeaa2';

  Future<void> fetchWeather(String cityName) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric&lang=vi';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _temperature = data['main']['temp'].toString();
          _description = data['weather'][0]['description'];
          _city = data['name'];
          _error = '';
        });
      } else {
        setState(() {
          _error = 'Không tìm thấy thành phố!';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Lỗi kết nối!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thời tiết'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Nhập tên thành phố',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.black.withOpacity(0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                fetchWeather(_cityController.text.trim());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Lấy thời tiết',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            if (_error.isNotEmpty)
              Text(
                _error,
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            if (_temperature.isNotEmpty) ...[
              Text(
                'Thành phố: $_city',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Nhiệt độ: $_temperature°C',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                'Thời tiết: $_description',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
