import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget{
  final Widget widget;
  const CustomCardView({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: double.infinity,
        height: 300, // Adjust the height as needed
        padding: const EdgeInsets.all(16.0),
        child: widget
      ),
    );
  }
}