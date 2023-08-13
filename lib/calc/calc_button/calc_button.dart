import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final Function onTap;
  const CalculatorButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      child: TextButton(
        onPressed: ()=>onTap(label),
        child: Text(
          label,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}