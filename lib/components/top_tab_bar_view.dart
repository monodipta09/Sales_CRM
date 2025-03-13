import 'package:flutter/cupertino.dart';

class TabItem {
  final String name;
  final Color color;

  TabItem({required this.name, required this.color});
}

class TabBarView extends StatefulWidget {
  final List<TabItem> tabs;
  final ValueChanged<int> onTabChanged;

  const TabBarView({
    Key? key,
    required this.tabs,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  _TabBarViewState createState() => _TabBarViewState();
}

class _TabBarViewState extends State<TabBarView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.0),
      child: CupertinoSlidingSegmentedControl<int>(
        backgroundColor: CupertinoColors.systemGrey2,
        thumbColor: widget.tabs[_selectedIndex].color,
        groupValue: _selectedIndex,
        onValueChanged: (int? value) {
          if (value != null) {
            setState(() {
              _selectedIndex = value;
            });
            widget.onTabChanged(value); // Notify parent about tab change
          }
        },
        children: {
          for (int i = 0; i < widget.tabs.length; i++)
            i: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.tabs[i].name,
                style: const TextStyle(color: CupertinoColors.white),
              ),
            ),
        },
      ),
    );
  }
}
