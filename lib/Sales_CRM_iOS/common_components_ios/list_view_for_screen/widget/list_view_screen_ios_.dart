import 'package:flutter/cupertino.dart';

class ListViewScreenIos extends StatelessWidget {
  final String title;
const ListViewScreenIos({ super.key, required this.title });

  @override
  Widget build(BuildContext context){
    return CupertinoListTile(
      title: Text(title, style: TextStyle(color: CupertinoColors.black)),
      leading: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey4,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(child: Text('M')),
      ),
      subtitle: Column(
        children: [
          Text('SubTitle 1', style: TextStyle(color: CupertinoColors.black)),
          Text('SubTitle 2', style: TextStyle(color: CupertinoColors.black)),
        ],
      ),
    );
  }
}