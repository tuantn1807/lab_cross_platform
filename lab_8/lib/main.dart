import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 8',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMIHomePage(),
    );
  }
}

class BMIHomePage extends StatefulWidget {
  @override
  _BMIHomePageState createState() => _BMIHomePageState();
}

class _BMIHomePageState extends State<BMIHomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _bmiResult = '';
  String _bmiCategory = '';

  void _calculateBMI() {
    double weight = double.tryParse(_weightController.text) ?? 0;
    double height = double.tryParse(_heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      double bmi = weight / (height * height);
      setState(() {
        _bmiResult = bmi.toStringAsFixed(2);
        if (bmi < 18.5) {
          _bmiCategory = 'Gầy';
        } else if (bmi >= 18.5 && bmi < 24.9) {
          _bmiCategory = 'Bình thường';
        } else if (bmi >= 25 && bmi < 29.9) {
          _bmiCategory = 'Thừa cân';
        } else {
          _bmiCategory = 'Béo phì';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Tính chỉ số BMI của bạn',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập cân nặng (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập chiều cao (m)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Tính BMI'),
            ),
            SizedBox(height: 16),
            if (_bmiResult.isNotEmpty) ...[
              Text(
                'Chỉ số BMI: $_bmiResult',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Phân loại: $_bmiCategory',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}