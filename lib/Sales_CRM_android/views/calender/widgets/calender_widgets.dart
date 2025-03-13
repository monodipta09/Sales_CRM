// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:get/get.dart';
// import '../controller/calender_controller.dart';
//
// class CalendarWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final CalendarControllerX calendarControllerX = Get.find();
//
//     return Obx(() {
//       return SfCalendar(
//         controller: calendarControllerX.calendarController,
//         view: _getViewFromController(calendarControllerX.selectedView.value),
//         monthViewSettings: MonthViewSettings(showAgenda: true),
//         dataSource: MeetingDataSource(calendarControllerX.appointments.toList()),
//
//         onTap: (details) {
//           if (details.appointments != null && details.appointments!.isNotEmpty) {
//             List<Appointment> tappedAppointments = details.appointments!
//                 .whereType<Appointment>()
//                 .toList();
//             _showEventMessage(context, tappedAppointments);
//           }
//         },
//       );
//     });
//   }
//
//   CalendarView _getViewFromController(String view) {
//     switch (view) {
//       case "Week":
//         return CalendarView.week;
//       case "Day":
//         return CalendarView.day;
//       case "Month":
//       default:
//         return CalendarView.month;
//     }
//   }
//
//   void _showEventMessage(BuildContext context, List<Appointment> events) {
//     final event = events.isNotEmpty ? events.first : null;
//     if (event != null) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Event Tapped"),
//             content: Text("You tapped on event: ${event.subject}"),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }
//
//
// // Data source for the calendar appointments
// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Appointment> source) {
//     appointments = source;
//   }
//
//   @override
//   Color getColor(int index) {
//     return appointments![index].color ?? Colors.blue;
//   }
//
//   @override
//   bool isAllDay(int index) {
//     return appointments![index].isAllDay;
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../controller/calender_controller.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarControllerX calendarControllerX = Get.find();

    return Obx(() {
      // Resetting the calendar controller to trigger full refresh
      calendarControllerX.calendarController.view =
          calendarControllerX.getCalendarView(calendarControllerX.selectedView.value);
      calendarControllerX.calendarController.displayDate =
          calendarControllerX.selectedDate.value;

      return Obx(() {
        return SfCalendar(
          controller: calendarControllerX.calendarController,
          view: _getViewFromController(calendarControllerX.selectedView.value),
          monthViewSettings: MonthViewSettings(showAgenda: true),
          dataSource: MeetingDataSource(calendarControllerX.appointments.toList()),  // Convert to list properly
          onTap: (details) {
            if (details.appointments != null && details.appointments!.isNotEmpty) {
              List<Appointment> tappedAppointments =
              details.appointments!.whereType<Appointment>().toList();
              _showEventMessage(context, tappedAppointments);
            }
          },
        );
      });


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
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Event Tapped"),
            content: Text("You tapped on event: ${event.subject}"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
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


//Data source for the calendar appointments
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  Color getColor(int index) {
    return appointments![index].color;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
