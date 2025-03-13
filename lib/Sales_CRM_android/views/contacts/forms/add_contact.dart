import 'package:flutter/material.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'CONTACT INFORMATION',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              buildInfoTile('Contact Owner', 'Agniva Bhattacharjee'),
              buildInfoTile('Lead Source', '-None-'),
              buildInfoTile('Salutation', '-None-'),
              buildTextField('First Name'),
              buildTextField('Last Name', isRequired: true),
              buildInfoTile('Account Name', ''),
              buildInfoTile('Vendor Name', ''),
              buildTextField('Email'),
              buildTextField('Title'),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Switch to Smart View',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
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
    return Column(
      children: [
        ListTile(
          title: Text(title, style: TextStyle(color: Colors.grey)),
          trailing: Text(value, style: TextStyle(fontSize: 16)),
          onTap: () {},
        ),
        Divider(),
      ],
    );
  }

  Widget buildTextField(String label, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: isRequired ? '$label *' : label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
