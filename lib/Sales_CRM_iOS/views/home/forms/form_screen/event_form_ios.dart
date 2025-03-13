import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sale_crm/Sales_CRM_iOS/common_components_ios/bottom_modal_ios/widget/bottom_modal_ios.dart';
import 'package:sale_crm/Sales_CRM_iOS/common_components_ios/generic_dropdown/widget/generic_dropdown_ios.dart';
import 'package:sale_crm/components/custom_input_IOS.dart';

import '../../../../../services/api_service.dart';
import '../form_controller/event_form_ios_controller.dart';

class EventFormIos extends StatelessWidget {
  
  final EventFormIosController _eventFormIosController = Get.put(EventFormIosController());

  EventFormIos({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BottomModalIos(
        // containerHeight: 800.0,
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text("Close"),
              onPressed: () {
                Get.back();
              },
            ),
            middle: Text("Add Event"),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text("Save"),
              onPressed: () {
                _eventFormIosController.submitForm();
                Get.back();
              },
            ),
          ),
          // title: Text("Add Event"),
          child: Container(
            height: double.infinity,
            padding: EdgeInsets.only(top: 60.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomInputIOS(
                    labelText: "Event Title",
                    hintText: 'Enter event title',
                    prefixIcon: Icon(CupertinoIcons.calendar),
                    isMandatory: true,
                    controller: _eventFormIosController.eventTitleController,
                  ),
                  SizedBox(height: 16.0),
                  // FutureBuilder for Active Users Dropdown
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: _eventFormIosController.futureActiveUsers,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CupertinoActivityIndicator());
                      }

                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return GenericDropdownIos<Map<String, dynamic>>(
                          labelText: "Please Assign Member(s)",
                          isMultiSelect: true,
                          items: snapshot.data!,
                          hintText: 'Username',
                          displayValue: (user) => user['USER_NAME'],
                          controller: _eventFormIosController.userController,
                          isMandatory: true,
                          prefixIcon: Icon(IconlyLight.user),
                          suffixIcon: Icon(CupertinoIcons.arrow_down),
                        );
                      } else {
                        return Text('No active users found');
                      }
                    },
                  ),
                  SizedBox(height: 16.0),
                  CustomInputIOS(
                    labelText: 'Meeting Link (if any)',
                    hintText: 'Enter meeting link',
                    controller: _eventFormIosController.meetingLinkController,
                    prefixIcon:
                        Icon(CupertinoIcons.link, color: theme.primaryColor),
                  ),
                  SizedBox(height: 16.0),
                  CustomInputIOS(
                    labelText: 'Start Date',
                    hintText: 'Select start date',
                    isMandatory: true,
                    controller: _eventFormIosController.startDateController,
                    inputType: InputType.date,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter a date for your event';
                    //   }
                    //   return null;
                    // },
                    prefixIcon: Icon(CupertinoIcons.calendar_today,
                        color: theme.primaryColor),
                  ),
                  SizedBox(height: 16.0),

                  Row(
                    children: [
                      Expanded(
                        child: CustomInputIOS(
                          labelText: 'Start Time',
                          isMandatory: true,
                          hintText: 'Enter start time',
                          inputType: InputType.time,
                          controller: _eventFormIosController.startTimeController,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter a start time';
                          //   }
                          //   return null;
                          // },
                          prefixIcon: Icon(CupertinoIcons.time,
                              color: theme.primaryColor),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: CustomInputIOS(
                          labelText: 'End Time',
                          isMandatory: true,
                          hintText: 'Enter end time',
                          inputType: InputType.time,
                          controller: _eventFormIosController.endTimeController,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter an end time';
                          //   }
                          //   return null;
                          // },
                          prefixIcon: Icon(CupertinoIcons.time_solid,
                              color: theme.primaryColor),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.0),

                  GenericDropdownIos<String>(
                    labelText: "Meeting repeat",
                    isMandatory: true,
                    hintText: "Meeting repeat",
                    items: _eventFormIosController.repeatMeetingDropDownValue,
                    isMultiSelect: false,
                    displayValue: (item) => item,
                    controller: _eventFormIosController.repeatMeetingController,
                    prefixIcon: Icon(CupertinoIcons.refresh_circled,
                        color: theme.primaryColor),
                  ),
                  SizedBox(height: 16.0),

                  GenericDropdownIos<String>(
                    labelText: "Remind me before?",
                    isMandatory: true,
                    hintText: "Remind me before?",
                    items: _eventFormIosController.remindBeforeDropDownValue,
                    isMultiSelect: false,
                    displayValue: (item) => item,
                    controller: _eventFormIosController.remindBeforeController,
                    prefixIcon:
                        Icon(CupertinoIcons.alarm, color: theme.primaryColor),
                  ),
                  SizedBox(height: 16.0),
                  CustomInputIOS(
                    labelText: 'Description',
                    hintText: 'Enter description',
                    controller: _eventFormIosController.descriptionController,
                    prefixIcon: Icon(CupertinoIcons.list_dash,
                        color: theme.primaryColor),
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
