import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
// import 'package:flutter/material.dart';

import '../../common_components_ios/custom_appbar_ios/view/custom_appbar.dart';
import '../controller/sales_crm_entry_point_ios_controller.dart';

class SalesCrmEntryPointIOS extends StatelessWidget {
  SalesCrmEntryPointIOS({super.key});
  final SalesCrmEntryPointIosController _salesCrmEntryPointIosController =
      Get.put(SalesCrmEntryPointIosController());

  @override
  Widget build(BuildContext context) {

    final List<String> tabs =
        ["Home", "Leads", "Contacts", "Accounts", "More"].obs;
    final List<IconData> icons = [
      IconlyBroken.home,
      IconlyBroken.bookmark,
      IconlyBroken.user_2,
      IconlyBroken.activity,
      IconlyBroken.more_circle,
    ].obs;

    return CupertinoPageScaffold(
      navigationBar: CustomAppbar(),
      child: Column(
        children: [
          // Page View (Scrollable Content)
          Expanded(
            child: PageView(
              controller: _salesCrmEntryPointIosController.pageController,
              onPageChanged: (index) =>
                  _salesCrmEntryPointIosController.currentPage.value = index,
              children: _salesCrmEntryPointIosController.pages,
            ),
          ),

          // Scrollable Bottom Navigation Bar
          Obx(() => Container(
                // padding: EdgeInsets.symmetric(vertical: 8),
                color: CupertinoColors.systemGrey6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(tabs.length, (index) {
                      return GestureDetector(
                        onTap: () =>
                            _salesCrmEntryPointIosController.animateToTab(index),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 17),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(icons[index],
                                  color: _salesCrmEntryPointIosController
                                              .currentPage.value ==
                                          index
                                      ? CupertinoColors.activeBlue
                                      : CupertinoColors.inactiveGray),
                              Text(
                                tabs[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: _salesCrmEntryPointIosController
                                              .currentPage.value ==
                                          index
                                      ? CupertinoColors.activeBlue
                                      : CupertinoColors.inactiveGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  /**  CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            onTap: (int index) {
              print("index $index");
              _salesCrmEntryPointIosController.goToTab(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_2_fill),
              ),
            ]),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return Center(child: Text('Content of tab $index'));
            },
          );
        },
      ),
      
  */

  // Widget _bottomAppBarItem(BuildContext context,
  //     {required icon, required page, required label}) {
  //   return ZoomTapAnimation(
  //     onTap: () => _salesCrmEntryPointAndroidController.goToTab(page),
  //     child: Container(
  //       color: Colors.transparent,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Icon(
  //             icon,
  //             color: _salesCrmEntryPointAndroidController.currentPage == page
  //                 ? ColorConstants.appColors
  //                 : Colors.grey,
  //             size: 20,
  //           ),
  //           Text(
  //             label,
  //             style: TextStyle(
  //                 color: _salesCrmEntryPointAndroidController.currentPage == page
  //                     ? ColorConstants.appColors
  //                     : Colors.grey,
  //                 fontSize: 13,
  //                 fontWeight: _salesCrmEntryPointAndroidController.currentPage == page
  //                     ? FontWeight.w600
  //                     : null),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
