import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:sale_crm/Sales_CRM_iOS/sales_CRM_entry_point_iOS/controller/sales_crm_entry_point_ios_controller.dart';

class CustomAppbarController extends GetxController {
  final SalesCrmEntryPointIosController _salesCrmEntryPointIosController =
      Get.find<SalesCrmEntryPointIosController>();

  RxInt get currentPage => _salesCrmEntryPointIosController.currentPage;

  String getAppBarTitle() {
    switch (currentPage.value) {
      case 0:
        return "Home";
      case 1:
        return "Leads";
      case 2:
        return "Contacts";
      case 3:
        return "Accounts";
      case 4:
        return "Deals";
      case 5:
        return "Billing";
      case 6:
        return "Summary";
      default:
        return "Home";
    }
  }
}
