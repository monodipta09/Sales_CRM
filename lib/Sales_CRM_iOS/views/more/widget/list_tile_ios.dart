import 'package:flutter/cupertino.dart';

class ListTileIos extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  final Function() onTap;
  const ListTileIos(
      {super.key,
      required this.isSelected,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      backgroundColor:
          isSelected ? CupertinoColors.systemGrey : CupertinoColors.systemGrey4,
      leading: Icon(icon, color: CupertinoColors.black),
      title: Text(title, style: TextStyle(color: CupertinoColors.black)),
      onTap: onTap,
    );
  }
}
