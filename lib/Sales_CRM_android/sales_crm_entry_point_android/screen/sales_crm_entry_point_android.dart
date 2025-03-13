// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconly/iconly.dart';
//
// import '../../common_components/custom_appbar/view/custom_app_bar.dart';
// import '../../views/more/screen/more_bottom_app_bar_item.dart';
// import '../controller/sales_crm_entry_point_android_controller.dart';
// import '../widgets/bottom_app_bar_item.dart';
//
// class SalesCrmEntryPointAndroid extends StatelessWidget {
//   SalesCrmEntryPointAndroid({super.key});
//   final SalesCrmEntryPointAndroidController _controller =
//   Get.put(SalesCrmEntryPointAndroidController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       bottomNavigationBar: BottomAppBar(
//         elevation: 0,
//         notchMargin: 10,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//           child: Obx(() => Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               BottomAppBarItem(
//                   icon: IconlyLight.calendar,
//                   page: 0,
//                   label: "Calendar",
//                   isSelected:
//                   _controller.currentPage.value == 0,
//                   onTap: () {
//                     _controller.animateToTab(0);
//                   }),
//               BottomAppBarItem(
//                   icon: IconlyLight.home,
//                   page: 1,
//                   label: "Home",
//                   isSelected:
//                   _controller.currentPage.value == 1,
//                   onTap: () {
//                     _controller.animateToTab(1);
//                   }),
//               BottomAppBarItem(
//                   icon: IconlyLight.bookmark,
//                   page: 2,
//                   label: "Leads",
//                   isSelected:
//                   _controller.currentPage.value == 2,
//                   onTap: () {
//                     _controller.animateToTab(2);
//                   }),
//               BottomAppBarItem(
//                   icon: IconlyLight.calling,
//                   page: 3,
//                   label: "Contacts",
//                   isSelected:
//                   _controller.currentPage.value == 3,
//                   onTap: () {
//                     _controller.animateToTab(3);
//                   }),
//               MoreBottomAppBarItem(
//                   controller: _controller),
//             ],
//           )),
//         ),
//       ),
//       body: PageView(
//         controller: _controller.pageController,
//         onPageChanged: (index) {
//           _controller.currentPage.value = index;
//         },
//         children: _controller.pages,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../common_components/custom_appbar/view/custom_app_bar.dart';
import '../../views/more/screen/more_bottom_app_bar_item.dart';
import '../controller/sales_crm_entry_point_android_controller.dart';
import '../widgets/bottom_app_bar_item.dart';

class SalesCrmEntryPointAndroid extends StatelessWidget {
  SalesCrmEntryPointAndroid({super.key});
  final SalesCrmEntryPointAndroidController _controller =
  Get.put(SalesCrmEntryPointAndroidController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        notchMargin: 8,
        child: Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Evenly space the items
          children: [
            BottomAppBarItem(
              icon: IconlyLight.calendar,
              page: 0,
              label: "Calendar",
              isSelected: _controller.currentPage.value == 0,
              onTap: () {
                _controller.animateToTab(0);
              },
            ),
            BottomAppBarItem(
              icon: IconlyLight.home,
              page: 1,
              label: "Home",
              isSelected: _controller.currentPage.value == 1,
              onTap: () {
                _controller.animateToTab(1);
              },
            ),
            BottomAppBarItem(
              icon: IconlyLight.bookmark,
              page: 2,
              label: "Leads",
              isSelected: _controller.currentPage.value == 2,
              onTap: () {
                _controller.animateToTab(2);
              },
            ),
            BottomAppBarItem(
              icon: IconlyLight.calling,
              page: 3,
              label: "Contacts",
              isSelected: _controller.currentPage.value == 3,
              onTap: () {
                _controller.animateToTab(3);
              },
            ),
            MoreBottomAppBarItem(
              controller: _controller,
            ),
          ],
        )),
      ),
      body: PageView(
        controller: _controller.pageController,
        onPageChanged: (index) {
          _controller.currentPage.value = index;
        },
        children: _controller.pages,
      ),
    );
  }
}


