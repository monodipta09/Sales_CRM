import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/sales_crm_entry_point_android/controller/sales_crm_entry_point_android_controller.dart';

class AppBarController extends GetxController {
  final SalesCrmEntryPointAndroidController salesCrmEntryPointAndroidController = Get.find<SalesCrmEntryPointAndroidController>();
  RxInt get currentPage => salesCrmEntryPointAndroidController.currentPage;
  String getAppBarTitle(){
    switch(currentPage.value){
      case 0:
        return "Calender";
      case 1:
        return "Home";
      case 2:
        return "Leads";
      case 3:
        return "Contacts";
      case 4:
        return "Account";
      case 5:
        return "Deals";
      case 6:
        return "Task";
      case 7:
        return "Summary";
      default:
        return "Sales CRM";
    }
  }


  IconData getLeftIcon(String title) {
    switch (title) {
      case "Calender":
        return Icons.calendar_month_outlined;
      case "Home":
        return Icons.home_sharp;
      case "Leads":
        return Icons.leaderboard_outlined;
      case "Contacts":
        return Icons.phone_android_outlined;
      case "Profile":
        return Icons.person_2_outlined;
      case "Account":
        return Icons.account_box;
      case "Deals":
        return Icons.handshake;
      case "Task":
        return Icons.task;
      case "Summary":
        return Icons.add_chart;
      default:
        return Icons.dashboard;
    }
  }
}
