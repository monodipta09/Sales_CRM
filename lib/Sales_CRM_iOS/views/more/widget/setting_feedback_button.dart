import 'package:flutter/cupertino.dart';

class SettingFeedbackButton extends StatelessWidget {
  const SettingFeedbackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: CupertinoButton(
              color: CupertinoColors.systemGrey3,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(CupertinoIcons.chat_bubble),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: CupertinoButton(
              color: CupertinoColors.systemGrey3,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(CupertinoIcons.gear),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
