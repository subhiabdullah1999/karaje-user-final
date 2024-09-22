import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:karajaapp/controller/homePage/notification_controller.dart';
import 'package:karajaapp/core/class/handlingdataview.dart';
import 'package:karajaapp/core/constant/routes.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsControllerImp());
    return GetBuilder<NotificationsControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Scaffold(
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
                        color: AppColor.black,
                        size: 15.sp,
                      )),
                ],
                title: Text(
                  'الإشعارات',
                  style: TextStyle(color: Colors.black87, fontSize: 15.sp),
                ),
                centerTitle: true,
              ),
              body: Container(
                height: double.infinity,
                child: controller.notifData.isEmpty
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
                              'لا يوجد اشعارات',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.sp),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.notifData.length,
                        itemBuilder: (context, index) {
                          String notificationTimeString =
                              controller.notifData[index]["updated_at"];
                          DateTime notificationTime =
                              DateTime.parse(notificationTimeString);
                          String hour = notificationTime.hour.toString();
                          String minuts = notificationTime.minute.toString();
                          String yearDate = notificationTime.year.toString();
                          String monDate = notificationTime.month.toString();
                          String dayDate = notificationTime.day.toString();

                          DateTime notifiTime24 = DateFormat(
                            'hh',
                          ).parse(hour);
                          DateTime notifiTimemin24 = DateFormat(
                            'mm',
                          ).parse(minuts);
                          String formattedNotifitTime12;
                          String formattedNotifiminutstTime12;

                          if (notifiTime24.hour < 12) {
                            formattedNotifiminutstTime12 =
                                DateFormat('m ص').format(notifiTimemin24);
                          } else {
                            formattedNotifiminutstTime12 =
                                DateFormat('m م').format(notifiTimemin24);
                          }
                          if (notifiTime24.hour < 12) {
                            formattedNotifitTime12 =
                                DateFormat('h').format(notifiTime24);
                          } else {
                            formattedNotifitTime12 =
                                DateFormat('h').format(notifiTime24);
                          }
                          return InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.notificationId, arguments: {
                                "listNotif": controller.notifData,
                                "id": index
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 0.8.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  border: Border.all(
                                      color: AppColor.greyLight, width: 0.5.w)),
                              child: ListTile(
                                title: Text(
                                  controller.notifData[index]["type"],
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                subtitle: Text(
                                  controller.notifData[index]["description"],
                                  style: TextStyle(
                                    color: AppColor.grey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                                leading: Image.asset(
                                  AppImageAsset.notification,
                                  height: 5.h,
                                ),
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "$yearDate-$monDate-$dayDate",
                                      // controller.notifData[index]["updated_at"],
                                      style: TextStyle(
                                          color: AppColor.black,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      "$formattedNotifitTime12:$formattedNotifiminutstTime12",
                                      // controller.notifData[index]["updated_at"],
                                      style: TextStyle(
                                          color: AppColor.black,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              ),
            )));
  }
}
