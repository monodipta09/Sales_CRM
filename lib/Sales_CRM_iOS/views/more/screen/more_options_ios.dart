import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sale_crm/Sales_CRM_iOS/common_components_ios/bottom_modal_ios/widget/bottom_modal_ios.dart';
import 'package:sale_crm/Sales_CRM_iOS/sales_CRM_entry_point_iOS/controller/sales_crm_entry_point_ios_controller.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/more/controller/menulist_controller.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/more/widget/list_tile_ios.dart';

import '../widget/profile_section_ios.dart';
import '../widget/setting_feedback_button.dart';

class MoreOptionsIos extends StatelessWidget {
  final bool isSelected;
  MoreOptionsIos({super.key, required this.isSelected});

  final SalesCrmEntryPointIosController _salesCrmEntryPointIosController =
      Get.find();
  final TextEditingController _searchController = TextEditingController();
  final MenulistController _menulistController = Get.put(MenulistController());

  @override
  Widget build(BuildContext context) {
    final List<String> pageNames = [
      "Home",
      "Leads",
      "Contacts",
      "Accounts",
      "Deals",
      "Billing"
    ];
    final List<IconData> pageIcons = [
      CupertinoIcons.home,
      CupertinoIcons.arrow_2_circlepath,
      CupertinoIcons.person_2,
      CupertinoIcons.building_2_fill,
      CupertinoIcons.money_dollar_circle,
      CupertinoIcons.check_mark
    ];

    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => BottomModalIos(
            // containerHeight: 780.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                //Close Button Section
                CupertinoButton(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text(
                      "Close",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Get.back();
                    }),
                // Profile Section
                ProfileSectionIos(),
                // Buttons
                SettingFeedbackButton(),
                // Modules Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Modules",
                          style: TextStyle(
                              color: CupertinoColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text("Customise",
                            style: TextStyle(
                                color: CupertinoColors.activeBlue,
                                fontSize: 16)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CupertinoSearchTextField(
                    controller: _searchController,
                    onChanged: _menulistController.search,
                    placeholder: 'Search Modules',
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                // Menu List
                Obx(
                  () => Expanded(
                    child: CupertinoScrollbar(
                      child: Container(
                        height: 500.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0)),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
                          children: List.generate(
                              _menulistController.searchResult.length, (index) {
                            return ListTileIos(
                              isSelected: _salesCrmEntryPointIosController
                                      .currentPage.value ==
                                  index,
                              icon:
                                  _menulistController.searchResultIcons[index],
                              title: _menulistController.searchResult[index],
                              onTap: () {
                                _salesCrmEntryPointIosController
                                    .animateToTab(index);
                                Get.back();
                              },
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(IconlyBroken.more_circle,
                color: isSelected
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.inactiveGray),
            Text(
              "More",
              style: TextStyle(
                fontSize: 14,
                color: isSelected
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.inactiveGray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title,
      {bool isSelected = false}) {
    return CupertinoListTile(
      backgroundColor:
          isSelected ? CupertinoColors.systemGrey : CupertinoColors.systemGrey4,
      leading: Icon(icon, color: CupertinoColors.black),
      title: Text(title, style: TextStyle(color: CupertinoColors.black)),
      onTap: () {},
    );
  }
}
