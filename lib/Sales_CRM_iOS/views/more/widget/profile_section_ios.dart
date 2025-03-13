import 'package:flutter/cupertino.dart';

class ProfileSectionIos extends StatelessWidget {
  const ProfileSectionIos({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 40, // Size of the circle
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CupertinoColors.systemGrey4, // Background color
            ),
            child: Center(
              child: Text("M", style: TextStyle(color: CupertinoColors.white)),
            ),
          ),
          SizedBox(width: 12),
          Text(
            "Shouvik Misra",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.black),
          ),
        ],
      ),
    );
  }
}
