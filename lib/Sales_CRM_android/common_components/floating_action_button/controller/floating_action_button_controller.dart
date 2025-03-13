import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/sales_crm_entry_point_android/controller/sales_crm_entry_point_android_controller.dart';

import '../../../views/contacts/forms/add_contact.dart';
import '../../../views/leads/forms/forms_screen/add_lead_form_screen.dart';

class FloatingActionButtonController extends GetxController{
  final SalesCrmEntryPointAndroidController _salesCrmEntryPointAndroidController = Get.find<SalesCrmEntryPointAndroidController>();

  RxInt get currentPageIndex => _salesCrmEntryPointAndroidController.currentPage;

  List<SpeedDialChild> getSpeedDialOptions() {
    if (currentPageIndex.value == 2) {
      return [
        SpeedDialChild(
          child: Icon(Icons.person_add),
          label: "Add Lead",
          onTap: () {
            Get.to((AddLeadFormScreen()));
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.import_contacts),
          label: "Import from Address Book",
          onTap: () => print("Import Lead Clicked"),
        ),
      ];
    } else if (currentPageIndex.value == 3) {
      return [
        SpeedDialChild(
          child: Icon(Icons.person_add),
          label: "Add Contact",
          onTap: (){
            Get.to(AddContactScreen());
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.import_contacts),
          label: "Import from Address Book",
          onTap: () => print("Import Contact Clicked"),
        ),
      ];
    } else {
      return [];
    }
  }
}