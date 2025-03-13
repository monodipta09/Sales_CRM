import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../components/generic_dropdown_component/controller/generic_dropdown_controller.dart';

class LeadFormController extends GetxController {
  // State management for UI elements
  var isExpanded = false.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  GenericDropdownController<String> sectorDropdownController = GenericDropdownController<String>(
    displayValue: (item) => item,
  );

  GenericDropdownController<String> sourceDropdownController = GenericDropdownController<String>(
    displayValue: (item) => item,
  );

  GenericDropdownController<String> countryDropdownController = GenericDropdownController<String>(
    displayValue: (item) => item,
  );

  // Controllers for each input field
  TextEditingController organizationNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController numberOfEmployeesController = TextEditingController();
  TextEditingController sectorController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  // Method to save the contact information (logic can be added here)
  void saveLead() {
    if (kDebugMode) {
      print('Organization Name: ${organizationNameController.text}');
      print('Number of Employees: ${numberOfEmployeesController.text}');
      print('Sector: ${sectorController.text}');
      print('Source: ${sourceController.text}');
      print('Website: ${websiteController.text}');
      print('Street: ${streetController.text}');
      print('City: ${cityController.text}');
      print('State: ${stateController.text}');
      print('ZIP/Postal Code: ${zipCodeController.text}');
      print('Country: ${countryController.text}');
    }
  }
}
