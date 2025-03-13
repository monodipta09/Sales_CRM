import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/home/controller/calendar_component_contoller.dart';

class DatepickerWidgetIos extends StatelessWidget {
  DatepickerWidgetIos({super.key});

  final CalendarComponentContoller calendarComponentContoller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: CupertinoDatePicker(
          initialDateTime: calendarComponentContoller.selectedDate.value,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          // This shows day of week alongside day of month
          showDayOfWeek: true,
          // This is called when the user changes the date.
          onDateTimeChanged: (DateTime newDate) {
            calendarComponentContoller.changeDate(newDate);
            calendarComponentContoller.getMonthName(newDate);
          },
        ));
  }
}
