import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MenulistController extends GetxController {
  final List<String> pageNames = [
    "Home",
    "Leads",
    "Contacts",
    "Accounts",
    "Deals",
    "Billing",
    "Summary"
  ];
  final List<IconData> pageIcons = [
    CupertinoIcons.home,
    CupertinoIcons.arrow_2_circlepath,
    CupertinoIcons.person_2,
    CupertinoIcons.building_2_fill,
    CupertinoIcons.money_dollar_circle,
    CupertinoIcons.check_mark,
    CupertinoIcons.chart_pie,
  ];
  var searchResult =
      ["Home", "Leads", "Contacts", "Accounts", "Deals", "Billing","Summary"].obs;

  var searchResultIcons = [
    CupertinoIcons.home,
    CupertinoIcons.arrow_2_circlepath,
    CupertinoIcons.person_2,
    CupertinoIcons.building_2_fill,
    CupertinoIcons.money_dollar_circle,
    CupertinoIcons.check_mark,
    CupertinoIcons.chart_pie,
  ].obs;

  var searchController = TextEditingController().obs;

  void search(String query) {
    searchResult.clear();
    searchResultIcons.clear();
    if (query.isEmpty) {
      // searchResult.addAll(pageNames);
      // searchResultIcons.addAll(pageIcons);
    }
    for (var i=0;i<pageNames.length;i++) {
      var page = pageNames[i];
      var icon = pageIcons[i];
      if (page.toLowerCase().contains(query.toLowerCase())) {
        searchResult.add(page);
        searchResultIcons.add(icon);
      }
    }
  }
}
