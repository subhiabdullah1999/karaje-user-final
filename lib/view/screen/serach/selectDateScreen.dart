import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karajaapp/core/constant/color.dart';
import 'package:karajaapp/view/widget/serach/customMatrerialButton.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../controller/search/selectDateController.dart';

class SelectDateScreen extends StatelessWidget {
  const SelectDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectDateController());
    Intl.defaultLocale = 'ar';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15.sp,
              )),
        ],
        title: Text(
          'وقت المغادرة',
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SelectDateController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.5.w),
          child: ListView(
            children: [
              TableCalendar(
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 14.sp,
                  ),
                  formatButtonVisible: false,
                ),
                daysOfWeekHeight: 5.h,
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(fontSize: 10.sp),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                    )),
                firstDay: DateTime.now(),
                lastDay:
                    DateTime(DateTime.now().year, DateTime.now().month + 2),
                focusedDay: controller.focusedDay,
                calendarStyle: const CalendarStyle(
                  markersMaxCount: 0,
                  selectedDecoration:
                      BoxDecoration(color: AppColor.primaryColor),
                    todayDecoration: BoxDecoration(color: Color.fromARGB(99, 236, 68, 30)),
                ),
                calendarFormat: controller.calendarFormat,
                onDaySelected: (selectedDay, focusedDay) {
                  controller.onDaySelected(selectedDay, focusedDay);
                },
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDate, day);
                },
                onPageChanged: (focusedDay) {
                  controller.focusedDay = focusedDay;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w),
                child: CustomMatrerialButton(
                  text: 'تحديد',
                  onPressed: () {},
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
