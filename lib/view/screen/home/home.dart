import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karajaapp/core/functions/alertdialogexitapp.dart';
import 'package:karajaapp/core/functions/alertexitapp.dart';
import 'package:karajaapp/view/screen/serach/travelDetailsScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/homePage/Home.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/functions/changeFormatTime.dart';
import '../../widget/home/CarouselSlider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SizedBox(
            width: 100.w,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomCarouselSlider(),
                Transform.translate(
                  offset: Offset(40.w, 1.h),
                  child: Text(
                    'الانطلاق',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Container(
                  height: 12.h,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.cities.length,
                    itemBuilder: (context, index) {
                      return Obx(() => GestureDetector(
                            onTap: () {
                              controller.start_id =
                                  '${controller.cities[index]["id"]}';
                              print('${controller.cities[index]["id"]}');
                              controller.selectedIndex1.value = index;
                              controller.search();
                            },
                            child: Container(
                              width: 30.w,
                              margin: EdgeInsets.symmetric(
                                vertical: 2.h,
                                horizontal: 2.w,
                              ),
                              // padding: EdgeInsets.only(top: 1.h),
                              decoration: BoxDecoration(
                                color: controller.selectedIndex1.value == index
                                    ? AppColor.orange
                                    : AppColor.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                                border: Border.all(
                                  color: AppColor.orange,
                                  width: 1.5,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  controller.cities[index]["name"],
                                  style: TextStyle(
                                    color:
                                        controller.selectedIndex1.value == index
                                            ? AppColor.white
                                            : AppColor.orange,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    var col1 = controller.selectedIndex1.value;
                    controller.selectedIndex1.value =
                        controller.selectedIndex2.value;
                    controller.selectedIndex2.value = col1;
                    var t = controller.end_id;
                    controller.end_id = controller.start_id;
                    controller.start_id = t;
                    controller.search();
                  },
                  child: Transform.translate(
                    offset: Offset(0.w, 1.h),
                    child: Container(
                      height: 6.h,
                      width: 6.h,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: AppColor.orange,
                          width: 0.2.w,
                        ),
                      ),
                      child: Icon(
                        Icons.swap_vert,
                        color: AppColor.orange,
                        size: 23.sp,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(40.w, 0.h),
                  child: Text(
                    'الوجهة',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0.w, -1.h),
                  child: Container(
                    height: 12.h,
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.cities.length,
                      itemBuilder: (context, index) {
                        return Obx(() => GestureDetector(
                              onTap: () {
                                print(controller.selectedIndex2.value);
                                controller.end_id =
                                    '${controller.cities[index]["id"]}';

                                controller.selectedIndex2.value = index;
                                controller.search();
                              },
                              child: Container(
                                width: 30.w,
                                margin: EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 2.w,
                                ),
                                // padding: EdgeInsets.only(top: 1.h),
                                decoration: BoxDecoration(
                                  color:
                                      controller.selectedIndex2.value == index
                                          ? AppColor.orange
                                          : AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: AppColor.orange,
                                    width: 1.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.cities[index]["name"],
                                    style: TextStyle(
                                      color: controller.selectedIndex2.value ==
                                              index
                                          ? AppColor.white
                                          : AppColor.orange,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(26.w, 0.h),
                  child: Text(
                    'الرحلات المنطلقة قريباً',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                  child: controller.searchedcities.isEmpty
                      ? Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              // repeat: false,
                              AppImageAsset.noTrips,
                              width: 32.w,
                              height: 12.h,
                            ),
                            Text(
                              'لا يوجد رحلات منطلقة قريباً',
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.searchedcities.length,
                          itemBuilder: (context, index) {
                            String startTimeString24 =
                                controller.searchedcities[index]['Start_Time'];
                            DateTime startTime24 = DateFormat(
                              'HH:mm',
                            ).parse(startTimeString24);
                            String formattedStartTime12;
                            if (startTime24.hour < 12) {
                              formattedStartTime12 =
                                  DateFormat('h:mm ص').format(startTime24);
                            } else {
                              formattedStartTime12 =
                                  DateFormat('h:mm م').format(startTime24);
                            }
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => const TravelDetailsScreen(),
                                    arguments: {
                                      'data': controller.searchedcities[index],
                                      'date': changeFormatDateForBackEnd(
                                          DateTime.now()),
                                      // 'date':
                                      //     '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}'
                                    });
                                // Add this line
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 40.w,
                                margin: EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 2.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                      offset: Offset(5, 5),
                                    )
                                  ],
                                  border: Border.all(
                                    color: AppColor.orange,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.searchedcities[index]
                                          ['company']['Companyname'],
                                      style: TextStyle(
                                        color: AppColor.orange,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    Text(
                                      controller.searchedcities[index]
                                              ['Start_Date'] +
                                          "\n" +
                                          formattedStartTime12,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColor.orange,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          )),
    );
  }
}
