import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/home/controller/calendar_component_contoller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarComponentIos extends StatelessWidget {
  CalendarComponentIos({super.key});

  final CalendarComponentContoller _calendarComponentContoller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SfCalendar(
        controller: _calendarComponentContoller.calendarComponentContoller,
        view: _getViewFromController(
            _calendarComponentContoller.selectedView.value),
        monthViewSettings: MonthViewSettings(showAgenda: true),
        dataSource: MeetingDataSource(
            _calendarComponentContoller.appointments.toList()),
        onTap: (details) {
          if (details.appointments != null &&
              details.appointments!.isNotEmpty) {
            List<Appointment> tappedAppointments =
                details.appointments!.whereType<Appointment>().toList();
            _showEventMessage(context, tappedAppointments);
          }
        },
      );
    });
  }

  CalendarView _getViewFromController(String view) {
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

    void _showEventMessage(BuildContext context, List<Appointment> events) {
    final event = events.isNotEmpty ? events.first : null;
    if (event != null) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Event Tapped"),
            content: Text("You tapped on event: ${event.subject}"),
            actions: <Widget>[
              CupertinoButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}



// Data source for the calendar appointments
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  Color getColor(int index) {
    return appointments![index].color ?? CupertinoColors.activeBlue;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
