import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/color_constants.dart';

class BottomAppBarItem extends StatelessWidget {
  final IconData icon;
  final int page;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomAppBarItem({
    Key? key,
    required this.icon,
    required this.page,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? ColorConstants.appColors : Colors.grey,
              size: 20,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? ColorConstants.appColors : Colors.grey,
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
