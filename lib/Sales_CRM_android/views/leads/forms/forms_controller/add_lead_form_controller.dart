import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../components/generic_dropdown.dart';

class LeadFormController extends GetxController {

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
    // You can validate the fields and save the contact information
    print('Organization Name: ${organizationNameController.text}');
    print('Email: ${emailController.text}');
    print('Contact Number: ${contactNumberController.text}');
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
