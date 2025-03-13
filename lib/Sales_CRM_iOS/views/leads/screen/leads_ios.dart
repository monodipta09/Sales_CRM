import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../components/top_tab_bar_view.dart';

class LeadsIos extends StatelessWidget {
const LeadsIos({ super.key });

  @override
  Widget build(BuildContext context){
   // return CupertinoPageScaffold(child: Center(child: Text("Leads Screen")));
    final List<TabItem> tabs = [
      TabItem(name: 'Midnight', color: const Color(0xff191970)),
      TabItem(name: 'Viridian', color: const Color(0xff40826d)),
      TabItem(name: 'Cerulean', color: const Color(0xff007ba7)),

    ];

    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            // Navigate to TabBarView with dynamic tabs using GetX
            Get.to(
                  () => TabBarView(
                tabs: tabs,
                onTabChanged: (index) {
                  print('Selected Tab: ${tabs[index].name}');
                },
              ),
            );
          },
          child: const Text('Go to Tab View'),
        ),
      ),
    );
  }
}



