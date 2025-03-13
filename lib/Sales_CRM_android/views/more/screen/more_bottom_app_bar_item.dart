// import 'package:flutter/material.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
// import '../../../sales_crm_entry_point_android/controller/sales_crm_entry_point_android_controller.dart';
// import '../../../utils/color_constants.dart';
//
//
// class MoreBottomAppBarItem extends StatelessWidget {
//   final SalesCrmEntryPointAndroidController controller;
//
//   const MoreBottomAppBarItem({super.key, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     bool isSelected = controller.currentPage.value >= 4;
//     return ZoomTapAnimation(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (context) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   title: const Text("Account"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     controller.animateToTab(4);
//                   },
//                 ),
//                 ListTile(
//                   title: const Text("Deals"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     controller.animateToTab(5);
//                   },
//                 ),
//                 ListTile(
//                   title: const Text("Task"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     controller.animateToTab(6);
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//       child: Container(
//         color: Colors.transparent,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Icons.more_horiz,
//               color: isSelected ? ColorConstants.appColors : Colors.grey,
//               size: 20,
//             ),
//             Text(
//               "More",
//               style: TextStyle(
//                 color: isSelected ? ColorConstants.appColors : Colors.grey,
//                 fontSize: 13,
//                 fontWeight: isSelected ? FontWeight.w600 : null,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../sales_crm_entry_point_android/controller/sales_crm_entry_point_android_controller.dart';
import '../../../utils/color_constants.dart';

class MoreBottomAppBarItem extends StatelessWidget {
  final SalesCrmEntryPointAndroidController controller;

  const MoreBottomAppBarItem({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    bool isSelected = controller.currentPage.value >= 4;
    return ZoomTapAnimation(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Close", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  // Profile Section
                  _buildProfileSection(),
                  SizedBox(height: 16),
                  // Settings & Feedback Buttons
                  _buildSettingsFeedbackButtons(),
                  SizedBox(height: 16),
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Modules',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildMenuItem(Icons.account_circle, "Account", 4, context),
                        _buildMenuItem(Icons.handshake, "Deals", 5, context),
                        _buildMenuItem(Icons.task, "Task", 6, context),
                        _buildMenuItem(Icons.add_chart, "Summary", 7, context)
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.more_horiz,
              color: isSelected ? ColorConstants.appColors : Colors.grey,
              size: 20,
            ),
            Text(
              "More",
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

  Widget _buildProfileSection() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey.shade400,
          child: Text("M", style: TextStyle(color: Colors.white)),
        ),
        SizedBox(width: 12),
        Text(
          "Madhurima Dey",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildSettingsFeedbackButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.chat_bubble),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.settings),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, int tabIndex, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(color: Colors.black)),
      onTap: () {
        Navigator.pop(context);
        controller.animateToTab(tabIndex);
      },
    );
  }
}