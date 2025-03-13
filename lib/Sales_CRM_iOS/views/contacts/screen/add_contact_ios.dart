import 'package:flutter/cupertino.dart';
import 'package:sale_crm/components/custom_input_IOS.dart';
import 'package:get/get.dart';

class AddContactScreenios extends StatelessWidget {
  const AddContactScreenios({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text("Close"),
          onPressed: () {
            Get.back();
          },
        ),
        middle: Text('Add Contact'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text("Save"),
          onPressed: () {},
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CONTACT IMAGE',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.systemGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(CupertinoIcons.camera, size: 40, color: CupertinoColors.systemGrey),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'CONTACT INFORMATION',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              buildInfoTile('Contact Owner', 'Shouvik Misra'),
              buildInfoTile('Lead Source', '-None-'),
              buildInfoTile('Salutation', '-None-'),
              buildTextField('First Name',CupertinoIcons.profile_circled),
              buildTextField('Last Name', CupertinoIcons.profile_circled, isRequired: true),
              buildInfoTile('Account Name', ''),
              buildInfoTile('Vendor Name', ''),
              buildTextField('Email',CupertinoIcons.mail),
              buildTextField('Title',CupertinoIcons.square_list),
              SizedBox(height: 16),
              Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    'Switch to Smart View',
                    style: TextStyle(color: CupertinoColors.activeBlue, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CupertinoButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(color: CupertinoColors.systemGrey)),
            Text(value, style: TextStyle(fontSize: 16)),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 12.0),
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      // child: CupertinoTextField(
      //   placeholder: isRequired ? '$label *' : label,
      //   padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(8),
      //     border: Border.all(color: CupertinoColors.systemGrey),
      //   ),
      // ),
      child: CustomInputIOS(
        labelText: label,
        hintText: label,
        prefixIcon: Icon(icon),
        isMandatory: isRequired,
      ),
    );
  }
}
