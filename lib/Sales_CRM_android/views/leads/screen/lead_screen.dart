import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sale_crm/Sales_CRM_android/common_components/floating_action_button/view/floating_action_button.dart';
import 'package:get/get.dart';
import '../controller/lead_controller.dart';
import '../lead_details/screen/lead_details_screen.dart';

class LeadScreen extends StatelessWidget {
  final LeadController leadController = Get.put(LeadController());

  LeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtonComponent(),
      appBar: AppBar(
        title: Text("All Leads"),
        actions: [
          Obx(() {
            return Row(
              children: [
                Icon(
                  Icons.sort,
                  color: Colors.black,
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: leadController.sortBy.value,
                  items: [
                    DropdownMenuItem(
                      value: 'updatedOn',
                      child: Text('Updated On'),
                    ),
                    DropdownMenuItem(
                      value: 'organisationName',
                      child: Text('Organisation Name'),
                    ),
                    DropdownMenuItem(
                      value: 'leadStatus',
                      child: Text('Lead Status'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      leadController.sortBy.value = value;
                      leadController.sortLeads();
                    }
                  },
                  underline: Container(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  dropdownColor: Colors.blueAccent,
                ),
                SizedBox(width: 12),
              ],
            );
          }),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: leadController.leadsList.length,
          itemBuilder: (context, index) {
            final lead = leadController.leadsList[index];
            return Card(
              child: ListTile(
                title: Text(lead.organisationName),
                subtitle: Text("Status: ${lead.leadStatus}"),
                trailing: Text(
                  "${lead.updatedOn.day}/${lead.updatedOn.month}/${lead.updatedOn.year}",
                ),
                onTap: () {
                  Get.to(() => LeadDetailPage(lead: lead));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
