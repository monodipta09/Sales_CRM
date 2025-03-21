import 'package:flutter/cupertino.dart';

class LeadDividerIos extends StatelessWidget {
  const LeadDividerIos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      margin: EdgeInsets.only(top: 8.0, bottom: 4.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
      ),
    );
  }
}
