import 'package:flutter/cupertino.dart';

class BottomAppbarItemIos extends StatelessWidget {
  final IconData icon;
  final int page;
  final String label;
  final bool isSelected;
  final GestureTapCallback onTap;

  const BottomAppbarItemIos(
      {super.key,
      required this.icon,
      required this.page,
      required this.label,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                color:
                    isSelected
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.inactiveGray),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color:
                    isSelected
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.inactiveGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
