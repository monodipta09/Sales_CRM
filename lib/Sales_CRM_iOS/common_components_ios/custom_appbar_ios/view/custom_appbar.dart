import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sale_crm/Sales_CRM_iOS/common_components_ios/custom_appbar_ios/controller/custom_appbar_controller.dart';

import '../../search_bar_ios/widget/search_bar_widget.dart';

class CustomAppbar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  CustomAppbar({super.key});

  final CustomAppbarController _customAppbarController =
      Get.put(CustomAppbarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => CupertinoNavigationBar(
          backgroundColor: const Color.fromARGB(255, 232, 232, 235),
          automaticBackgroundVisibility: false,
          leading: Icon(IconlyLight.filter),
          middle: Text(
            _customAppbarController.getAppBarTitle(),
            style: TextStyle(
              color: CupertinoColors.black,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.only(right: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.to(SearchPage());
                  },
                  child: Icon(
                    IconlyLight.search,
                  ),
                ),
                if (_customAppbarController.getAppBarTitle() != "Home")
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Icon(CupertinoIcons.plus),
                  ),
                if (_customAppbarController.getAppBarTitle() != "Home")
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Icon(CupertinoIcons.ellipsis_vertical),
                  ),
              ],
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    // Return true to fully obstruct the content below, or false if you want it to be partially obstructed
    return true;
  }
}
