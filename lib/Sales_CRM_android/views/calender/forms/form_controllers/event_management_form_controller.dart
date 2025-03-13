// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
//
// import '../../../views/calender/controller/calender_controller.dart';
//
// class EventFormController {
//   void submitForm(
//       GlobalKey<FormState> formKey,
//       TextEditingController eventTitleController,
//       TextEditingController startDateController,
//       TextEditingController startTimeController,
//       TextEditingController endTimeController,
//       BuildContext context,
//       ) {
//     if (formKey.currentState!.validate()) {
//       String eventTitle = eventTitleController.text;
//       String dateString = startDateController.text;
//       DateTime selectedDate = DateFormat('yyyy-MM-dd').parse(dateString); // Format the date
//
//       // Parse the start time
//       String startTimeString = startTimeController.text;
//       startTimeString = startTimeString.replaceAll(RegExp(r'\s?(AM|PM)$'), '');  // Remove AM/PM for parsing
//       String amPmStart = startTimeController.text.contains("AM") ? "AM" : "PM"; // Check if it's AM or PM
//       List<String> timeParts = startTimeString.split(':');
//       int startHour = int.parse(timeParts[0]);
//       int startMinute = int.parse(timeParts[1]);
//
//       // Adjust the hour based on AM/PM
//       if (amPmStart == "PM" && startHour != 12) {
//         startHour += 12;  // Convert PM hour to 24-hour format
//       } else if (amPmStart == "AM" && startHour == 12) {
//         startHour = 0;  // Convert 12 AM to 0 hour
//       }
//
//       TimeOfDay startTime = TimeOfDay(hour: startHour, minute: startMinute);
//
//       // Parse the end time
//       String endTimeString = endTimeController.text;
//       endTimeString = endTimeString.replaceAll(RegExp(r'\s?(AM|PM)$'), '');  // Remove AM/PM for parsing
//       String amPmEnd = endTimeController.text.contains("AM") ? "AM" : "PM"; // Check if it's AM or PM
//       List<String> timePartsEnd = endTimeString.split(':');
//       int endHour = int.parse(timePartsEnd[0]);
//       int endMinute = int.parse(timePartsEnd[1]);
//
//       // Adjust the hour based on AM/PM
//       if (amPmEnd == "PM" && endHour != 12) {
//         endHour += 12;  // Convert PM hour to 24-hour format
//       } else if (amPmEnd == "AM" && endHour == 12) {
//         endHour = 0;  // Convert 12 AM to 0 hour
//       }
//
//       TimeOfDay endTime = TimeOfDay(hour: endHour, minute: endMinute);
//
//       // Create event and add to the calendar
//       Appointment newEvent = Appointment(
//         startTime: DateTime(selectedDate.year, selectedDate.month, selectedDate.day, startTime.hour, startTime.minute),
//         endTime: DateTime(selectedDate.year, selectedDate.month, selectedDate.day, endTime.hour, endTime.minute),
//         subject: eventTitle,
//         color: Colors.blue,
//         isAllDay: false,
//       );
//
//       // Add the event using the CalendarControllerX
//       Get.find<CalendarControllerX>().addEvent(newEvent);
//
//       // Optionally show success message or reset the form
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Event Added!')));
//       Navigator.of(context).pop();  // Close the dialog after submission
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../controller/calender_controller.dart';

// import '../../../views/calender/controller/calender_controller.dart';

class EventFormController {
  void submitForm(
      GlobalKey<FormState> formKey,
      TextEditingController eventTitleController,
      TextEditingController startDateController,
      TextEditingController startTimeController,
      TextEditingController endTimeController,
      BuildContext context,
      ) {
    if (formKey.currentState!.validate()) {
      String eventTitle = eventTitleController.text;
      String dateString = startDateController.text;
      DateTime selectedDate = DateFormat('yyyy-MM-dd').parse(dateString); // Format the date

      // Parse the start time
      String startTimeString = startTimeController.text;
      print("Raw Start Time String: $startTimeString"); // Debug print

      startTimeString = startTimeString.replaceAll(RegExp(r'\s?(AM|PM)$'), '');  // Remove AM/PM for parsing
      String amPmStart = startTimeController.text.contains("AM") ? "AM" : "PM"; // Check if it's AM or PM
      List<String> timeParts = startTimeString.split(':');
      int startHour = int.parse(timeParts[0]);
      int startMinute = int.parse(timeParts[1]);

      // Adjust the hour based on AM/PM
      if (amPmStart == "PM" && startHour != 12) {
        startHour += 12;  // Convert PM hour to 24-hour format
      } else if (amPmStart == "AM" && startHour == 12) {
        startHour = 0;  // Convert 12 AM to 0 hour
      }

      TimeOfDay startTime = TimeOfDay(hour: startHour, minute: startMinute);
      print("Parsed Start Time: $startHour:$startMinute $amPmStart"); // Debug print

      // Parse the end time
      String endTimeString = endTimeController.text;
      print("Raw End Time String: $endTimeString"); // Debug print

      endTimeString = endTimeString.replaceAll(RegExp(r'\s?(AM|PM)$'), '');  // Remove AM/PM for parsing
      String amPmEnd = endTimeController.text.contains("AM") ? "AM" : "PM"; // Check if it's AM or PM
      List<String> timePartsEnd = endTimeString.split(':');
      int endHour = int.parse(timePartsEnd[0]);
      int endMinute = int.parse(timePartsEnd[1]);

      // Adjust the hour based on AM/PM
      if (amPmEnd == "PM" && endHour != 12) {
        endHour += 12;  // Convert PM hour to 24-hour format
      } else if (amPmEnd == "AM" && endHour == 12) {
        endHour = 0;  // Convert 12 AM to 0 hour
      }

      TimeOfDay endTime = TimeOfDay(hour: endHour, minute: endMinute);
      print("Parsed End Time: $endHour:$endMinute $amPmEnd"); // Debug print

      // Ensure the end time is after the start time
      DateTime startDateTime = DateTime(
          selectedDate.year, selectedDate.month, selectedDate.day, startTime.hour, startTime.minute);
      DateTime endDateTime = DateTime(
          selectedDate.year, selectedDate.month, selectedDate.day, endTime.hour, endTime.minute);

      if (endDateTime.isBefore(startDateTime)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('End time must be after start time!')),
        );
        return;
      }

      // Create event and add to the calendar
      Appointment newEvent = Appointment(
        startTime: startDateTime,
        endTime: endDateTime,
        subject: eventTitle,
        color: Colors.blue,
        isAllDay: false,
      );

      // Add the event using the CalendarControllerX
      Get.find<CalendarControllerX>().addEvent(newEvent);

      // Optionally show success message or reset the form
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Event Added!')));
      Navigator.of(context).pop();  // Close the dialog after submission
    }
  }
}
