import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:karajaapp/core/class/handlingdataview.dart';
import 'package:karajaapp/core/functions/changeFormatTime.dart';
import 'package:karajaapp/view/widget/serach/customMatrerialButton.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../controller/search/travelDetailsController.dart';
import '../../widget/serach/cardForTravelDetails.dart';

class TravelDetailsScreen extends StatelessWidget {
  const TravelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const SizedBox(),
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
          'تفاصيل الرحلة',
          style: TextStyle(color: Colors.black, fontSize: 15.sp),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<TravelDetailsController>(
          init: TravelDetailsController(),
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Form(
                  key: controller.formstate,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                    child: ListView(
                      children: [
                        Obx(() {
                          // Format start time
                          String startTimeString24 =
                              controller.data['Start_Time'];
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
                          String endTimeString24 = controller.data['End_Time'];
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

                          return CardForTravelDetails(
                            numChair: controller.selectedIndices.length,
                            idNumberController: controller.travelIdNumber,
                            mobileController: controller.travelMobile,
                            linkImage:
                                'logos/${controller.data['company']['logo']}',
                            nameCompany: controller.data['company']
                                    ['Companyname']
                                .toString(),
                            startPoint: controller.data['Start_City']['name'],
                            endPoint: controller.data['End_City']['name'],
                            startPlace: controller.data['Start_City']['name'],
                            endPlace: controller.data['End_City']['name'],
                            startTime: formattedStartTime12,
                            endTime: formattedEndTime12,
                            period: _getFormattedPeriod(
                                controller.data['Start_Time'],
                                controller.data['End_Time']),
                            isSelected: controller.isSelected,
                            day:
                                // Jiffy.parse('${DateTime.parse(
                                //     controller.data['Start_Date'])}').fromNow(),
                                DateTime.now()
                                    .difference(DateTime.parse(
                                        controller.data['Start_Date']))
                                    .inDays
                                    .toString(),
                            hour: getHours(controller.data['Start_Time']),
                            minute: getMinutes(controller.data['Start_Time']),
                            nameController: controller.travelName,
                            methodePaymint: controller.methodePaymintList,
                            price: (controller.data['Price'] *
                                controller.selectedIndices.length),
                            onChanged: (val) {
                              // controller.changePaymentMethode(val,controller.data['Price'] *controller.selectedIndices.length);
                              //print('///${controller.data['Price'] *controller.selectedIndices.length}');
                            },
                            onTapForAdd: () {
                              // print(getHours(controller.data['Start_Time']));
                              // print(getMinutes(controller.data['Start_Time']));

                              controller.addChair();
                            },
                          );
                        }),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40.w,
                              child: CustomMatrerialButton(
                                text: 'تأكيد',
                                onPressed: () {
                                  controller.onNext();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            SizedBox(
                              width: 40.w,
                              child: CustomMatrerialButtonWithBorder(
                                text: 'إلغاء',
                                onPressed: () {
                                  controller.onCancel();
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
