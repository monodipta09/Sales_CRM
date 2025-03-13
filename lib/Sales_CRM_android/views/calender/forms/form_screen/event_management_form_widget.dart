import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/custom_input.dart';
import '../../../../../components/generic_dropdown_component/UI/generic_dropdown.dart';
import '../../../../../components/generic_dropdown_component/controller/generic_dropdown_controller.dart';
import '../../../../../services/api_service.dart';
//   Import the controller file
//
// class EventFormModal extends StatelessWidget {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _eventTitleController = TextEditingController();
//   final TextEditingController _meetingLinkController = TextEditingController();
//   final TextEditingController _startDateController = TextEditingController();
//   final TextEditingController _startTimeController = TextEditingController();
//   final TextEditingController _endTimeController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//
//   final GenericDropdownController<String> repeatMeetingController = GenericDropdownController<String>(
//     displayValue: (item) => item,
//   );
//
//   final GenericDropdownController<String> remindBeforeController = GenericDropdownController<String>(
//     displayValue: (item) => item,
//   );
//
//   final GenericDropdownController<String> userController = GenericDropdownController<String>(
//     displayValue: (item) => item,
//   );
//
//   final List<String> repeatMeetingDropDownValue = ["None", "Daily", "Weekly", "Monthly", "Yearly"];
//   final List<String> remindBeforeDropDownValue = ["1 hour", "2 hours", "12 hours", "24 hours"];
//   final List<String> userDropDownValue = ["user1", "user2", "user3", "user4"];
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     Get.put(EventFormController());
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: AppStyles.defaultBorderRadius,
//         ),
//         insetPadding: EdgeInsets.all(16.0),
//         child: Padding(
//           padding: AppStyles.defaultPadding,
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Add Event',
//                     style: theme.textTheme.bodyLarge?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   CustomInput(
//                     labelText: 'Event Title',
//                     isMandatory: true,
//                     hintText: 'Enter event title',
//                     controller: _eventTitleController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter an event title';
//                       }
//                       return null;
//                     },
//                     prefixIcon: Icon(Icons.event, color: theme.colorScheme.primary),
//                   ),
//                   SizedBox(height: 16.0),
//
//                   GenericDropdown<String>(
//                     labelText: "Please Assign Member(s)",
//                     isMandatory: true,
//                     hintText: "Username",
//                     items: userDropDownValue,
//                     isMultiSelect: true,
//                     displayValue: (item) => item,
//                     controller: userController,
//                     prefixIcon: Icon(Icons.person, color: theme.colorScheme.primary),
//                   ),
//                   SizedBox(height: 16.0),
//
//                   CustomInput(
//                     labelText: 'Meeting Link (if any)',
//                     hintText: 'Enter meeting link',
//                     controller: _meetingLinkController,
//                     prefixIcon: Icon(Icons.link, color: theme.colorScheme.primary),
//                   ),
//                   SizedBox(height: 16.0),
//
//                   CustomInput(
//                     labelText: 'Start Date',
//                     hintText: 'Select start date',
//                     isMandatory: true,
//                     controller: _startDateController,
//                     inputType: InputType.date,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a date for your event';
//                       }
//                       return null;
//                     },
//                     prefixIcon: Icon(Icons.calendar_today, color: theme.colorScheme.primary),
//                     onDateSelected: (date) {},
//                   ),
//                   SizedBox(height: 16.0),
//
//                   Row(
//                     children: [
//                       Expanded(
//                         child: CustomInput(
//                           labelText: 'Start Time',
//                           isMandatory: true,
//                           hintText: 'Enter start time',
//                           inputType: InputType.time,
//                           controller: _startTimeController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a start time';
//                             }
//                             return null;
//                           },
//                           prefixIcon: Icon(Icons.access_time, color: theme.colorScheme.primary),
//                         ),
//                       ),
//                       SizedBox(width: 16.0),
//                       Expanded(
//                         child: CustomInput(
//                           labelText: 'End Time',
//                           isMandatory: true,
//                           hintText: 'Enter end time',
//                           inputType: InputType.time,
//                           controller: _endTimeController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter an end time';
//                             }
//                             return null;
//                           },
//                           prefixIcon: Icon(Icons.access_time_filled, color: theme.colorScheme.primary),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16.0),
//
//                   GenericDropdown<String>(
//                     labelText: "Meeting repeat",
//                     isMandatory: true,
//                     hintText: "Meeting repeat",
//                     items: repeatMeetingDropDownValue,
//                     isMultiSelect: true,
//                     displayValue: (item) => item,
//                     controller: repeatMeetingController,
//                     prefixIcon: Icon(Icons.refresh_outlined, color: theme.colorScheme.primary),
//                   ),
//                   SizedBox(height: 16.0),
//
//                   GenericDropdown<String>(
//                     labelText: "Remind me before?",
//                     isMandatory: true,
//                     hintText: "Remind me before?",
//                     items: remindBeforeDropDownValue,
//                     isMultiSelect: true,
//                     displayValue: (item) => item,
//                     controller: remindBeforeController,
//                     prefixIcon: Icon(Icons.access_alarm_outlined, color: theme.colorScheme.primary),
//                   ),
//                   SizedBox(height: 16.0),
//
//                   CustomInput(
//                     labelText: 'Description',
//                     hintText: 'Enter description',
//                     controller: _descriptionController,
//                     prefixIcon: Icon(Icons.notes, color: theme.colorScheme.primary),
//                   ),
//                   SizedBox(height: 24.0),
//
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: AppStyles.smallPadding,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: AppStyles.defaultBorderRadius,
//                         ),
//                       ),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // Pass form data to the controller for further processing
//                           Get.find<EventFormController>().submitForm(
//                             _formKey,
//                             _eventTitleController,
//                             _startDateController,
//                             _startTimeController,
//                             _endTimeController,
//                             context,
//                           );
//                         }
//                       },
//                       child: Text('Save'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../form_controllers/event_management_form_controller.dart';

class EventFormModal extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _meetingLinkController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GenericDropdownController<String> repeatMeetingController =
  GenericDropdownController<String>(displayValue: (item) => item);
  final GenericDropdownController<String> remindBeforeController =
  GenericDropdownController<String>(displayValue: (item) => item);

  final GenericDropdownController<Map<String, dynamic>> userController =
  GenericDropdownController<Map<String, dynamic>>(
    displayValue: (user) => user['USER_NAME'],
  );

  final List<String> repeatMeetingDropDownValue = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
    "Yearly"
  ];
  final List<String> remindBeforeDropDownValue = [
    "1 hour",
    "2 hours",
    "12 hours",
    "24 hours"
  ];

  final ApiService _apiService = Get.find<ApiService>();

  // Store Future to prevent multiple API calls
  final Future<List<Map<String, dynamic>>> _futureActiveUsers;

  EventFormModal({Key? key})
      : _futureActiveUsers = getActiveUsersMap(),
        super(key: key);

  static Future<List<Map<String, dynamic>>> getActiveUsersMap() async {
    try {
      List<dynamic>? users = await Get.find<ApiService>().getAllUsers();

      if (users == null || users.isEmpty) {
        print("No users found");
        return [];
      }

      print("API Response: $users");

      List<Map<String, dynamic>> activeUsersList = users
          .whereType<Map<String, dynamic>>() // Ensure each item is a Map
          .where((user) => user['ACTIVE'] == true) // FIXED: Corrected boolean check
          .map((user) => {
        'USER_ID': user['USER_ID']?.toString() ?? '',
        'USER_NAME': user['USER_NAME']?.toString() ?? 'Unknown',
      })
          .where((user) => user['USER_ID']!.isNotEmpty) // Ensure valid ID
          .toList();

      print("Final Active Users List: $activeUsersList");

      return activeUsersList;
    } catch (error, stackTrace) {
      print("Error while processing active users: $error");
      print(stackTrace);
      return [];
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.put(EventFormController());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        insetPadding: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Event',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 16.0),

                  CustomInput(
                    labelText: 'Event Title',
                    isMandatory: true,
                    hintText: 'Enter event title',
                    controller: _eventTitleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an event title';
                      }
                      return null;
                    },
                    prefixIcon: Icon(Icons.event, color: theme.colorScheme.primary),
                  ),
                  SizedBox(height: 16.0),

                  // FutureBuilder for Active Users Dropdown
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: _futureActiveUsers,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return GenericDropdown<Map<String, dynamic>>(
                          labelText: "Please Assign Member(s)",
                          isMultiSelect: true,
                          items: snapshot.data!,
                          hintText: 'Username',
                          displayValue: (user) => user['USER_NAME'],
                          controller: userController,
                          isMandatory: true,
                        );
                      } else {
                        return Text('No active users found');
                      }
                    },
                  ),
                  SizedBox(height: 16.0),

                  CustomInput(
                    labelText: 'Meeting Link (if any)',
                    hintText: 'Enter meeting link',
                    controller: _meetingLinkController,
                    prefixIcon: Icon(Icons.link, color: theme.colorScheme.primary),
                  ),
                  SizedBox(height: 16.0),

                  CustomInput(
                    labelText: 'Start Date',
                    hintText: 'Select start date',
                    isMandatory: true,
                    controller: _startDateController,
                    inputType: InputType.date,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a date for your event';
                      }
                      return null;
                    },
                    prefixIcon: Icon(Icons.calendar_today, color: theme.colorScheme.primary),
                  ),
                  SizedBox(height: 16.0),

                  Row(
                    children: [
                      Expanded(
                        child: CustomInput(
                          labelText: 'Start Time',
                          isMandatory: true,
                          hintText: 'Enter start time',
                          inputType: InputType.time,
                          controller: _startTimeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a start time';
                            }
                            return null;
                          },
                          prefixIcon: Icon(Icons.access_time, color: theme.colorScheme.primary),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: CustomInput(
                          labelText: 'End Time',
                          isMandatory: true,
                          hintText: 'Enter end time',
                          inputType: InputType.time,
                          controller: _endTimeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an end time';
                            }
                            return null;
                          },
                          prefixIcon: Icon(Icons.access_time_filled, color: theme.colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),

                  GenericDropdown<String>(
                    labelText: "Meeting repeat",
                    isMandatory: true,
                    hintText: "Meeting repeat",
                    items: repeatMeetingDropDownValue,
                    isMultiSelect: false,
                    displayValue: (item) => item,
                    controller: repeatMeetingController,
                    prefixIcon: Icon(Icons.refresh_outlined, color: theme.colorScheme.primary),
                  ),
                  SizedBox(height: 16.0),

                  GenericDropdown<String>(
                    labelText: "Remind me before?",
                    isMandatory: true,
                    hintText: "Remind me before?",
                    items: remindBeforeDropDownValue,
                    isMultiSelect: false,
                    displayValue: (item) => item,
                    controller: remindBeforeController,
                    prefixIcon: Icon(Icons.access_alarm_outlined, color: theme.colorScheme.primary),
                  ),
                  SizedBox(height: 16.0),


              CustomInput(
                    labelText: 'Description',
                    hintText: 'Enter description',
                    controller: _descriptionController,
                    prefixIcon: Icon(Icons.notes, color: theme.colorScheme.primary),
                  ),
                  SizedBox(height: 24.0),

                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.find<EventFormController>().submitForm(
                            _formKey,
                            _eventTitleController,
                            _startDateController,
                            _startTimeController,
                            _endTimeController,
                            context,
                          );
                        }
                      },
                      child: Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

