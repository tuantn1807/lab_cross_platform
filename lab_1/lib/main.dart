import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I Am Rich'),
          backgroundColor: Colors.deepOrangeAccent[900],
        ),
        backgroundColor: Colors.amberAccent,
        body: const Center(
          child: Image(
            image: AssetImage('assets/images/diamond.jpg'),
          ),
        ),
      ),
    );
  }
}
