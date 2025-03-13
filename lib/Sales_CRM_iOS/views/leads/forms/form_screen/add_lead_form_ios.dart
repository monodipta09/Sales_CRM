import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_iOS/common_components_ios/generic_dropdown/widget/generic_dropdown_ios.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/leads/forms/form_controller/add_lead_form_controller_ios.dart';
import 'package:sale_crm/components/custom_input_IOS.dart';

class AddLeadFormIos extends StatelessWidget {
  const AddLeadFormIos({super.key});

  @override
  Widget build(BuildContext context) {
    final AddLeadFormControllerIos _addLeadController =
        Get.put(AddLeadFormControllerIos());
// Example lists for the dropdowns (can be fetched from an API or database)
    final sectors = ['Technology', 'Finance', 'Healthcare', 'Education'];
    final sources = ['Web', 'Referral', 'Ad Campaign', 'Direct'];
    final countries = ['USA', 'Canada', 'India', 'Germany'];

    var isExpanded = false.obs; // Controls the "Show all fields" functionality

    void changeView() {
      isExpanded.value = !isExpanded.value;
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
            child: Text("Close"),
            onPressed: () {
              Get.back();
            }),
        middle: Text('Add Lead'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text('Save'),
          onPressed: () {
            _addLeadController.saveLead();
          },
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header: Lead Information
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  'LEAD INFORMATION',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.activeBlue,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Contact Information Section
              _buildSectionHeader('Contact Information'),
              CustomInputIOS(
                hintText: 'Organization Name',
                isMandatory: true,
                controller: _addLeadController.organizationNameController,
                prefixIcon: Icon(CupertinoIcons.building_2_fill),
              ),
              SizedBox(height: 16),
              CustomInputIOS(
                hintText: 'Email',
                controller: _addLeadController.emailController,
                inputType: InputType.text,
                prefixIcon: Icon(CupertinoIcons.mail),
              ),
              SizedBox(height: 16),
              CustomInputIOS(
                hintText: 'Contact Number',
                controller: _addLeadController.contactNumberController,
                inputType: InputType.number,
                prefixIcon: Icon(CupertinoIcons.phone),
              ),
              SizedBox(height: 16),
              CustomInputIOS(
                hintText: 'Number of Employees',
                controller: _addLeadController.numberOfEmployeesController,
                inputType: InputType.number,
                prefixIcon: Icon(CupertinoIcons.group),
              ),
              SizedBox(height: 16),

              Obx(() => isExpanded.value
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Sector Dropdown
                        GenericDropdownIos<String>(
                          hintText: 'Select Sector',
                          labelText: 'Sector',
                          isMandatory: true,
                          items: sectors,
                          displayValue: (item) => item,
                          controller:
                              _addLeadController.sectorDropdownController,
                          prefixIcon: Icon(CupertinoIcons.bag),
                        ),
                        SizedBox(height: 16),

                        // Source Dropdown
                        GenericDropdownIos<String>(
                          labelText: 'Source',
                          hintText: 'Select Source',
                          items: sources,
                          displayValue: (item) => item,
                          controller:
                              _addLeadController.sourceDropdownController,
                          prefixIcon: Icon(CupertinoIcons.folder),
                        ),
                        SizedBox(height: 16),

                        // Website Field
                        CustomInputIOS(
                          hintText: 'Website',
                          controller: _addLeadController.websiteController,
                          prefixIcon: Icon(CupertinoIcons.globe),
                        ),
                        SizedBox(height: 20),

                        // Address Section (Initially hidden in Smart View)

                        _buildSectionHeader('Address'),
                        CustomInputIOS(
                          hintText: 'Street',
                          controller: _addLeadController.streetController,
                          prefixIcon: Icon(CupertinoIcons.location),
                        ),
                        SizedBox(height: 16),
                        CustomInputIOS(
                          hintText: 'City',
                          controller: _addLeadController.cityController,
                          prefixIcon: Icon(CupertinoIcons.placemark),
                        ),
                        SizedBox(height: 16),
                        CustomInputIOS(
                          hintText: 'State',
                          controller: _addLeadController.stateController,
                          prefixIcon: Icon(CupertinoIcons.location),
                        ),
                        SizedBox(height: 16),
                        CustomInputIOS(
                          hintText: 'ZIP/Postal Code',
                          controller: _addLeadController.zipCodeController,
                          prefixIcon: Icon(CupertinoIcons.pin),
                        ),
                        SizedBox(height: 16),
                        // Country Dropdown
                        GenericDropdownIos<String>(
                          labelText: 'Country',
                          hintText: 'Select Country',
                          items: countries,
                          displayValue: (item) => item,
                          controller:
                              _addLeadController.countryDropdownController,
                          prefixIcon: Icon(CupertinoIcons.flag),
                        ),
                        SizedBox(height: 16),
                      ],
                    )
                  : Container()),

              // Toggle "Show all fields" functionality
              SizedBox(height: 20),
              Obx(() {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      changeView();
                    },
                    child: Text(
                      isExpanded.value
                          ? 'Switch to Smart View'
                          : 'Show all fields',
                      style: TextStyle(
                        color: CupertinoColors.activeBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build section headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: CupertinoColors.systemGrey,
        ),
      ),
    );
  }
}
