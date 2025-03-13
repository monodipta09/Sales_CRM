import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CalendarComponentContoller extends GetxController {
  var selectedView = "Month".obs;
  var selectedDate = DateTime.now().obs;
  var appointments = <Appointment>[].obs;
  var selectedMonth = DateFormat.MMMM().format(DateTime.now()).obs;

  late CalendarController calendarComponentContoller;

  @override
  void onInit() {
    super.onInit();
    calendarComponentContoller = CalendarController();
    calendarComponentContoller.view = _getCalendarView(selectedView.value);
    calendarComponentContoller.displayDate = selectedDate.value;
  }

  void changeView(String view) {
    selectedView.value = view;
    calendarComponentContoller.view = _getCalendarView(view);
    update();
  }

  void changeDate(DateTime date) {
    selectedDate.value = date;
    calendarComponentContoller.displayDate = date;
    update();
  }

  /// ✅ Fix: Trigger calendar refresh correctly
  void addEvent(Appointment event) {
    appointments.add(event);
    update();
  }

  void getMonthName(DateTime date) {
    selectedMonth.value = DateFormat.MMMM().format(date);
    update();
  }

  CalendarView _getCalendarView(String view) {
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

  void onFloatingActionButtonPressed() {
    final event = Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'New Event',
      color: CupertinoColors.activeBlue,
      isAllDay: false,
    );
    addEvent(event);
  }
}
