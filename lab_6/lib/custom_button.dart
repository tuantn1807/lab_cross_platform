import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  CustomButton({required this.text, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }
}
