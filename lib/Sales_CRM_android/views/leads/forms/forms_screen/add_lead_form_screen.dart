import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/components/custom_input.dart';
import '../../../../../components/generic_dropdown_component/UI/generic_dropdown.dart';
import '../forms_controller/add_lead_form_controller.dart';

class AddLeadFormScreen extends StatelessWidget {
  const AddLeadFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeadFormController());
    final sectors = ['Technology', 'Finance', 'Healthcare', 'Education'];
    final sources = ['Web', 'Referral', 'Ad Campaign', 'Direct'];
    final countries = ['USA', 'Canada', 'India', 'Germany'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Lead',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, size: 28),
            onPressed: controller.saveLead,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader('LEAD INFORMATION'),
              _buildCard([
                _buildSectionHeader('Contact Information'),
                CustomInput(
                  labelText: 'Organization Name',
                  isMandatory: true,
                  controller: controller.organizationNameController,
                  prefixIcon: const Icon(Icons.business),
                ),
                const SizedBox(height: 16),
                CustomInput(
                  labelText: 'Email',
                  controller: controller.emailController,
                  inputType: InputType.text,
                  prefixIcon: const Icon(Icons.email),
                ),
                const SizedBox(height: 16),
                CustomInput(
                  labelText: 'Contact Number',
                  controller: controller.contactNumberController,
                  inputType: InputType.number,
                  prefixIcon: const Icon(Icons.phone),
                ),
                const SizedBox(height: 16),
                CustomInput(
                  labelText: 'Number of Employees',
                  controller: controller.numberOfEmployeesController,
                  inputType: InputType.number,
                  prefixIcon: const Icon(Icons.group),
                ),
              ]),

              Obx(() => controller.isExpanded.value
                  ? _buildCard([
                GenericDropdown<String>(
                  labelText: 'Sector',
                  isMandatory: true,
                  items: sectors,
                  displayValue: (item) => item,
                  controller: controller.sectorDropdownController,
                  prefixIcon: const Icon(Icons.business_center),
                ),
                const SizedBox(height: 16),
                GenericDropdown<String>(
                  labelText: 'Source',
                  items: sources,
                  displayValue: (item) => item,
                  controller: controller.sourceDropdownController,
                  prefixIcon: const Icon(Icons.source),
                ),
                const SizedBox(height: 16),
                CustomInput(
                  labelText: 'Website',
                  controller: controller.websiteController,
                  prefixIcon: const Icon(Icons.web),
                ),
                const SizedBox(height: 20),
                _buildSectionHeader('Address'),
                CustomInput(
                  labelText: 'Street',
                  controller: controller.streetController,
                  prefixIcon: const Icon(Icons.location_on),
                ),
                const SizedBox(height: 16),
                CustomInput(
                  labelText: 'City',
                  controller: controller.cityController,
                  prefixIcon: const Icon(Icons.location_city),
                ),
                const SizedBox(height: 16),
                CustomInput(
                  labelText: 'State',
                  controller: controller.stateController,
                  prefixIcon: const Icon(Icons.location_on),
                ),
                const SizedBox(height: 16),
                CustomInput(
                  labelText: 'ZIP/Postal Code',
                  controller: controller.zipCodeController,
                  prefixIcon: const Icon(Icons.pin_drop),
                ),
                const SizedBox(height: 16),
                GenericDropdown<String>(
                  labelText: 'Country',
                  items: countries,
                  displayValue: (item) => item,
                  controller: controller.countryDropdownController,
                  prefixIcon: const Icon(Icons.flag),
                ),
              ])
                  : Container()),

              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: controller.toggleExpanded,
                  child: Obx(() => Text(
                    controller.isExpanded.value
                        ? 'Switch to Smart View'
                        : 'Show all fields',
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
