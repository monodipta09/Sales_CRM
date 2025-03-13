import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/home/controller/calendar_component_contoller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../services/api_service.dart';
import '../../../../common_components_ios/generic_dropdown/widget/generic_dropdown_ios.dart';

class EventFormIosController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController eventTitleController = TextEditingController();
  final TextEditingController meetingLinkController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final GenericDropdownControllerIos<String> repeatMeetingController =
      GenericDropdownControllerIos<String>(displayValue: (item) => item);
  final GenericDropdownControllerIos<String> remindBeforeController =
      GenericDropdownControllerIos<String>(displayValue: (item) => item);

  final GenericDropdownControllerIos<Map<String, dynamic>> userController =
      GenericDropdownControllerIos<Map<String, dynamic>>(
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
  final Future<List<Map<String, dynamic>>> futureActiveUsers;

  EventFormIosController() : futureActiveUsers = getActiveUsersMap();

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
          .where((user) =>
              user['ACTIVE'] == true) // FIXED: Corrected boolean check
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

  void submitForm() {
    print("Form submitted");
    String eventTitle = eventTitleController.text;
    String dateString = startDateController.text;
    DateTime selectedDate =
        DateFormat('yyyy-MM-dd').parse(dateString); // Format the date

    // Parse the start time
    String startTimeString = startTimeController.text;
    print("Raw Start Time String: $startTimeString"); // Debug print

    startTimeString = startTimeString.replaceAll(
        RegExp(r'\s?(AM|PM)$'), ''); // Remove AM/PM for parsing
    String amPmStart = startTimeController.text.contains("AM")
        ? "AM"
        : "PM"; // Check if it's AM or PM
    List<String> timeParts = startTimeString.split(':');
    int startHour = int.parse(timeParts[0]);
    int startMinute = int.parse(timeParts[1]);

    // Adjust the hour based on AM/PM
    if (amPmStart == "PM" && startHour != 12) {
      startHour += 12; // Convert PM hour to 24-hour format
    } else if (amPmStart == "AM" && startHour == 12) {
      startHour = 0; // Convert 12 AM to 0 hour
    }

    Duration startTime = Duration(hours: startHour, minutes: startMinute);
    print(
        "Parsed Start Time: $startHour:$startMinute $amPmStart"); // Debug print

    // Parse the end time
    String endTimeString = endTimeController.text;
    print("Raw End Time String: $endTimeString"); // Debug print

    endTimeString = endTimeString.replaceAll(
        RegExp(r'\s?(AM|PM)$'), ''); // Remove AM/PM for parsing
    String amPmEnd = endTimeController.text.contains("AM")
        ? "AM"
        : "PM"; // Check if it's AM or PM
    List<String> timePartsEnd = endTimeString.split(':');
    int endHour = int.parse(timePartsEnd[0]);
    int endMinute = int.parse(timePartsEnd[1]);

    // Adjust the hour based on AM/PM
    if (amPmEnd == "PM" && endHour != 12) {
      endHour += 12; // Convert PM hour to 24-hour format
    } else if (amPmEnd == "AM" && endHour == 12) {
      endHour = 0; // Convert 12 AM to 0 hour
    }

   Duration endTime =Duration(hours: endHour, minutes: endMinute);
    print("Parsed End Time: $endHour:$endMinute $amPmEnd"); // Debug print

    // Ensure the end time is after the start time
    DateTime startDateTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, startTime.inHours, startTime.inMinutes);
    DateTime endDateTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, endTime.inHours, endTime.inMinutes);

    if (endDateTime.isBefore(startDateTime)) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('End time must be after start time!')),
      // );
      Get.snackbar("Error", "End time must be after start time!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: CupertinoColors.white,
          colorText: CupertinoColors.systemRed);
      return;
    }
    print("eventTitle: $eventTitle");
    print("selectedDate: $selectedDate");
    print("startTime: $startTime");
    print("endTime: $endTime");
    print("startDateTime: $startDateTime");
    print("endDateTime: $endDateTime");
    print("repeatMeetingController: ${repeatMeetingController.selectedValue}");
    print("remindBeforeController: ${remindBeforeController.selectedValue}");
    print("userController: ${userController.selectedValue}");
    

    // Create event and add to the calendar
    Appointment newEvent = Appointment(
      startTime: startDateTime,
      endTime: endDateTime,
      subject: eventTitle,
      color: CupertinoColors.activeBlue,
      isAllDay: false,
    );

    // Add the event using the CalendarControllerX
    Get.find<CalendarComponentContoller>().addEvent(newEvent);

    // Optionally show success message or reset the form
    Get.snackbar("Event", "Event Added",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: CupertinoColors.white,
        colorText: CupertinoColors.activeBlue);
  }
}
