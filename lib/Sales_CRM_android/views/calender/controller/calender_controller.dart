import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class CalendarControllerX extends GetxController {
  var selectedView = "Month".obs;
  var selectedDate = DateTime.now().obs;
  var appointments = <Appointment>[].obs;

  late CalendarController calendarController;

  @override
  void onInit() {
    super.onInit();
    calendarController = CalendarController();
    calendarController.view = getCalendarView(selectedView.value);
    calendarController.displayDate = selectedDate.value;
  }

  void changeView(String view) {
    selectedView.value = view;
    calendarController.view = getCalendarView(view);
    update();
  }

  void changeDate(DateTime date) {
    selectedDate.value = date;
    calendarController.displayDate = date;
    update();
  }

  /// ✅ Fix: Trigger calendar refresh correctly
  void addEvent(Appointment event) {
    // Add the event to the appointments list
    appointments.add(event);
    update();  // Trigger a refresh to update the UI

    // Ensure the calendar view is updated when the event is added
    calendarController.view = getCalendarView(selectedView.value);
    calendarController.displayDate = selectedDate.value;

    // Trigger a calendar refresh by resetting the selectedDate and manually calling update
    calendarController.selectedDate = selectedDate.value;
    update();
  }





  CalendarView getCalendarView(String view) {
    switch (view) {
      case "Week":
        return CalendarView.week;
      case "Day":
        return CalendarView.day;
      case "Month":
      default:
        return CalendarView.month;
    }
  }

}



