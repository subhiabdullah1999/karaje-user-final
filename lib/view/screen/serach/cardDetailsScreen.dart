import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karajaapp/core/class/handlingdataview.dart';
import 'package:karajaapp/view/screen/home/mainscreen.dart';
import 'package:karajaapp/view/widget/serach/customMatrerialButton.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../controller/search/cardDetailsController.dart';
import '../../../core/class/crud.dart';
import '../../../core/functions/changeFormatTime.dart';
import '../../widget/serach/cardForCardDetails.dart';
import '../../widget/serach/imageQr.dart';
import '../../widget/serach/rowDataForCard.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CardDetailsController());
    Get.put(Crud());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                Get.deleteAll();
                Get.offAll(() => MainScreen());
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15.sp,
              )),
        ],
        title: Text(
          'التذكرة',
          style: TextStyle(color: Colors.black, fontSize: 15.sp),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<CardDetailsController>(builder: (controller) {
        // Format start time
        String startTimeString24 = controller.data['Trip']['Start_Time'];
        DateTime startTime24 = DateFormat('HH:mm').parse(startTimeString24);
        String formattedStartTime12;

        if (startTime24.hour < 12) {
          formattedStartTime12 = DateFormat('h:mm ص').format(startTime24);
        } else {
          formattedStartTime12 = DateFormat('h:mm م').format(startTime24);
        }

        // Format end time
        String endTimeString24 = controller.data['Trip']['End_Time'];
        DateTime endTime24 = DateFormat('HH:mm').parse(endTimeString24);
        String formattedEndTime12;

        if (endTime24.hour < 12) {
          formattedEndTime12 = DateFormat('h:mm ص').format(endTime24);
        } else {
          formattedEndTime12 = DateFormat('h:mm م').format(endTime24);
        }
        ;

        String _getFormattedPeriod(String startTime, String endTime) {
          DateTime startDateTime = DateFormat('HH:mm').parse(startTime);
          DateTime endDateTime = DateFormat('HH:mm').parse(endTime);

          // Calculate the difference in hours and minutes
          Duration difference = endDateTime.difference(startDateTime);
          int totalMinutes = difference.inMinutes;

          // Calculate hours and minutes separately
          int hours = totalMinutes ~/ 60;
          int minutes = totalMinutes % 60;

          // Format hours for 12-hour clock format
          int displayHours = hours % 12;
          if (displayHours == 0) {
            displayHours = 12; // Convert 0 to 12 for 12-hour format
          }

          // Format hours and minutes with leading zeros
          String formattedHours =
              displayHours < 10 ? '0$displayHours' : '$displayHours';
          String formattedMinutes = minutes < 10 ? '0$minutes' : '$minutes';

          // Construct and return the formatted period string
          return '$formattedHours:$formattedMinutes';
        }

        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: ListView(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.person,
                          color: Colors.black54,
                          size: 30.sp,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        controller.data['name'],
                        style: TextStyle(color: Colors.black, fontSize: 10.sp),
                      ),
                    ],
                  ),
                  CardForCardDetails(
                    startPoint: controller.data['Trip']['Start_City']['name'],
                    endPoint: controller.data['Trip']['End_City']['name'],
                    startPlace: controller.data['Trip']['Start_City']['name'],
                    endPlace: controller.data['Trip']['End_City']['name'],
                    startTime: formattedStartTime12,
                    endTime: formattedEndTime12,
                    period: _getFormattedPeriod(
                        controller.data['Trip']['Start_Time'],
                        controller.data['Trip']['End_Time']),
                    day: DateTime.now()
                        .difference(DateTime.parse(
                            controller.data['Trip']['Start_Date']))
                        .inDays
                        .toString(),
                    hour: getHours(controller.data['Trip']['Start_Time']),
                    minute: getMinutes(controller.data['Trip']['Start_Time']),
                    price: controller.data['totalPrice'].toString(),
                  ),
                  SizedBox(height: 1.h),
                  RowDataForCard(
                      numChair: controller.data['NumChairs'],
                      numberBus:
                          controller.data['Trip']['NumberOfBus'].toString(),
                      price: controller.data['totalPrice'].toString(),
                      typeBus: 'رجال أعمال'),
                  SizedBox(
                    height: 1.h,
                  ),
                  ImageQR(
                    data: controller.data['id'].toString(),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: CustomMatrerialButton(
                      text: 'تحميل',
                      onPressed: () {
                        controller.onDownloadCard();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: CustomMatrerialButtonWithBorder(
                      text: 'حجز تذكرة اخرى',
                      onPressed: () {
                        controller.onSaveAnotherCard();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
