import 'package:flutter/cupertino.dart';

class CustomCardViewIos extends StatelessWidget {
  final Widget widget;
  const CustomCardViewIos ({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300, // Adjust the height as needed
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.3),
            blurRadius: 4,
            spreadRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: widget,
    );
  }
}
