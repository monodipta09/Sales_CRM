import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sale_crm/Sales_CRM_android/views/more/screen/more_bottom_app_bar_item.dart';
import 'package:sale_crm/Sales_CRM_iOS/common_components_ios/bottom_modal_ios/widget/bottom_modal_ios.dart';
import 'package:sale_crm/Sales_CRM_iOS/sales_CRM_entry_point_iOS/widget/bottom_appbar_item_ios.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/more/screen/more_options_ios.dart';
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
                width: double.infinity,
                color: CupertinoColors.systemGrey6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(tabs.length, (index) {
                      if (index <= 3) {
                        return BottomAppbarItemIos(
                            icon: icons[index],
                            label: tabs[index],
                            page: index,
                            isSelected: _salesCrmEntryPointIosController
                                    .currentPage.value ==
                                index,
                            onTap: () {
                              _salesCrmEntryPointIosController
                                  .animateToTab(index);
                            });
                      } else {
                        return MoreOptionsIos(
                            isSelected: _salesCrmEntryPointIosController
                                    .currentPage.value >=
                                4);
                      }
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
