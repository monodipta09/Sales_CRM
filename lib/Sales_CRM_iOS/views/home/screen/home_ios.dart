import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/home/controller/calendar_component_contoller.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/home/widget/calendar_component_ios.dart';

import '../widget/datepicker_widget_ios.dart';

class HomeIos extends StatelessWidget {
  HomeIos({super.key});
  final CalendarComponentContoller calendarComponentContoller =
      Get.put(CalendarComponentContoller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(calendarComponentContoller.selectedMonth.value),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(CupertinoIcons.ellipsis_vertical),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () {
                            // Navigator.pop(context);
                            Get.back();
                            calendarComponentContoller.changeView("Month");
                          },
                          child: Text('Month View'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            // Navigator.pop(context);
                            Get.back();
                            calendarComponentContoller.changeView("Week");
                          },
                          child: Text('Week View'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            // Navigator.pop(context);
                            Get.back();
                            calendarComponentContoller.changeView("Day");
                          },
                          child: Text('Day View'),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () => Get.back(), //Navigator.pop(context),
                        isDefaultAction: true,
                        child: Text('Cancel'),
                      ),
                    ),
                  );
                },
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(CupertinoIcons.calendar),
                onPressed: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => Container(
                      height: 216,
                      padding: const EdgeInsets.only(top: 6.0),
                      // The Bottom margin is provided to align the popup above the system
                      // navigation bar.
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      // Provide a background color for the popup.
                      color:
                          CupertinoColors.systemBackground.resolveFrom(context),
                      // Use a SafeArea widget to avoid system overlaps.
                      child: DatepickerWidgetIos(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        child: CalendarComponentIos(),
      );
    });
  }
}
