import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_iOS/common_components_ios/generic_dropdown/widget/generic_dropdown_ios.dart';

class AddLeadFormControllerIos extends GetxController {
  GenericDropdownControllerIos<String> sectorDropdownController =
      GenericDropdownControllerIos<String>(
    displayValue: (item) => item,
  );

  GenericDropdownControllerIos<String> sourceDropdownController =
      GenericDropdownControllerIos<String>(
    displayValue: (item) => item,
  );

  GenericDropdownControllerIos<String> countryDropdownController =
      GenericDropdownControllerIos<String>(
    displayValue: (item) => item,
  );

  // Example lists for the dropdowns (can be fetched from an API or database)
    final sectors = ['Technology', 'Finance', 'Healthcare', 'Education'];
    final sources = ['Web', 'Referral', 'Ad Campaign', 'Direct'];
    final countries = ['USA', 'Canada', 'India', 'Germany'];
    
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
