import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karajaapp/core/class/handlingdataview.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../controller/homePage/myReservationController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/serach/cardForMyTickets.dart';

class MyReservationScreen extends StatelessWidget {
  const MyReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyReservationController());
    return GetBuilder<MyReservationController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: controller.data.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            // repeat: false,
                            AppImageAsset.noData,
                            width: 80.w,
                            height: 35.h,
                          ),
                          Text(
                            'لا يوجد حجوزات',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.sp),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        // Format start time
                        String startTimeString24 =
                            controller.data[index]['Trip']['Start_Time'];
                        DateTime startTime24 =
                            DateFormat('HH:mm').parse(startTimeString24);
                        String formattedStartTime12;
                        if (startTime24.hour < 12) {
                          formattedStartTime12 =
                              DateFormat('h:mm ص').format(startTime24);
                        } else {
                          formattedStartTime12 =
                              DateFormat('h:mm م').format(startTime24);
                        }

                        // Format end time
                        String endTimeString24 =
                            controller.data[index]['Trip']['End_Time'];
                        DateTime endTime24 =
                            DateFormat('HH:mm').parse(endTimeString24);
                        String formattedEndTime12;
                        if (endTime24.hour < 12) {
                          formattedEndTime12 =
                              DateFormat('h:mm ص').format(endTime24);
                        } else {
                          formattedEndTime12 =
                              DateFormat('h:mm م').format(endTime24);
                        }
                        ;

                        String _getFormattedPeriod(
                            String startTime, String endTime) {
                          DateTime startDateTime =
                              DateFormat('HH:mm').parse(startTime);
                          DateTime endDateTime =
                              DateFormat('HH:mm').parse(endTime);

                          // Calculate the difference in hours and minutes
                          Duration difference =
                              endDateTime.difference(startDateTime);
                          int totalMinutes = difference.inMinutes;

                          // Calculate hours and minutes separately
                          int hours = totalMinutes ~/ 60;
                          int minutes = totalMinutes % 60;

                          // Format hours for 12-hour clock format
                          int displayHours = hours % 12;
                          if (displayHours == 0) {
                            displayHours =
                                12; // Convert 0 to 12 for 12-hour format
                          }

                          // Format hours and minutes with leading zeros
                          String formattedHours = displayHours < 10
                              ? '0$displayHours'
                              : '$displayHours';
                          String formattedMinutes =
                              minutes < 10 ? '0$minutes' : '$minutes';

                          // Construct and return the formatted period string
                          return '$formattedHours:$formattedMinutes';
                        }

                        return CardForMyTickets(
                          isWidget: true,
                          isPendeing:
                              controller.data[index]['status'] == 'pending',
                          data: controller.data[index]['id'].toString(),
                          date: DateFormat('yyyy/MM/dd').format(DateTime.parse(
                              controller.data[index]['Trip']['Start_Date'])),
                          startPlace: controller.data[index]['Trip']
                              ['Start_City']['name'],
                          endPlace: controller.data[index]['Trip']['End_City']
                              ['name'],
                          startTime: formattedStartTime12,
                          endTime: formattedEndTime12,
                          period: _getFormattedPeriod(
                              controller.data[index]['Trip']['Start_Time'],
                              controller.data[index]['Trip']['End_Time']),
                          numChair: controller.data[index]['NumChairs'],
                          priceTicket:
                              controller.data[index]['totalPrice'].toString(),
                          companyName: controller.data[index]['company']
                                  ['Companyname']
                              .toString(),
                          linkImage:
                              'logos/${controller.data[index]['company']['logo']}',
                          name: controller.data[index]['name'].toString(),
                          onPressed: () {
                            controller.onDownloadCard(controller.data[index]);
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 0.3.h,
                        );
                      },
                      itemCount: controller.data.length)));
    });
  }
}
