import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/search/travelDetailsController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/functions/validinput.dart';
import '../../../linkapi.dart';
import 'customDropDownbotton.dart';
import 'customTextFormField.dart';
import 'customTextFormFieldWithoutWrite.dart';

class CardForTravelDetails extends StatelessWidget {
  final String nameCompany;
  final int? numChair;

  final String linkImage;
  final String startPlace;
  final String startTime;
  final String endPlace;
  final String endTime;
  final String startPoint;
  final String endPoint;
  final String day;
  final String hour;
  final String minute;
  final String period;
  final int price;
  final TextEditingController nameController;
  final TextEditingController mobileController;

  final TextEditingController idNumberController;

  final void Function()? onTapForAdd;
  final List methodePaymint;
  final void Function(Object?)? onChanged;
  final isSelected;

  const CardForTravelDetails(
      {super.key,
      required this.nameCompany,
      required this.startPlace,
      required this.startTime,
      required this.endPlace,
      required this.endTime,
      required this.startPoint,
      required this.endPoint,
      required this.period,
      required this.day,
      required this.hour,
      required this.minute,
      required this.nameController,
      this.onTapForAdd,
      required this.methodePaymint,
      this.onChanged,
      required this.price,
      this.isSelected,
      required this.linkImage,
      this.numChair,
      required this.mobileController,
      required this.idNumberController});

  @override
  Widget build(BuildContext context) {
    Get.put(TravelDetailsController());
    return GetBuilder<TravelDetailsController>(builder: (controller) {
      return SizedBox(
        width: 94.w,
        height: controller.isNotValid == true ? 95.h : 93.h,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.5.w)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: AppImageAsset.logo,
                      image: AppLink.imagesServer + linkImage,
                      height: 5.h,
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      nameCompany,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            startPlace,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black, fontSize: 13.sp),
                          ),
                          Text(
                            startTime,
                            style:
                                TextStyle(color: Colors.black, fontSize: 11.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 40.w, child: Image.asset(AppImageAsset.vip)),
                      Column(
                        children: [
                          Text(
                            endPlace,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black, fontSize: 13.sp),
                          ),
                          Text(
                            endTime,
                            style:
                                TextStyle(color: Colors.black, fontSize: 11.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'الانطلاق من',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.black, fontSize: 9.5.sp),
                        ),
                        Text(
                          startPoint,
                          style:
                              TextStyle(color: Colors.black, fontSize: 9.5.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'مدة الرحلة : ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.black, fontSize: 10.5.sp),
                        ),
                        Text(
                          period,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColor.primaryColor, fontSize: 11.sp),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'الوصول إلى',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.black, fontSize: 9.5.sp),
                        ),
                        Text(
                          endPoint,
                          style:
                              TextStyle(color: Colors.black, fontSize: 9.5.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Column(
                  children: [
                    Text(
                      'الرحلة سوف تنطلق بعد',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 11.sp),
                    ),
                    SizedBox(
                      height: 0.7.h,
                    ),
                    Text(
                      ' $day يوم $hour ساعة $minute دقيقة ',
                      style: TextStyle(
                          color: AppColor.primaryColor, fontSize: 11.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormField(
                    controller: nameController,
                    hintText: 'اسم المسافر الذي سيستخدم التذكرة',
                    labelText: 'اسم المسافر',
                    textInputType: TextInputType.none,
                    hideCursorAndBorder: true,
                    validator: (val) {
                      return validInput(val!, 1, 15, 'none');
                    }),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormField(
                    controller: mobileController,
                    hintText: 'رقم المسافر الذي سيستخدم التذكرة',
                    labelText: 'رقم المسافر',
                    textInputType: TextInputType.none,
                    hideCursorAndBorder: true,
                    validator: (val) {
                      return validInput(val!, 10, 10, 'none');
                    }),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormField(
                    controller: idNumberController,
                    hintText: 'الرقم الوطني للمسافر الذي سيستخدم التذكرة',
                    labelText: 'الرقم الوطني للمسافر',
                    textInputType: TextInputType.none,
                    hideCursorAndBorder: true,
                    validator: (val) {
                      return validInput(val!, 11, 11, 'none');
                    }),
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                  onTap: onTapForAdd,
                  child: CustomTextFormFieldWithoutWrite(
                    icon: Icons.add,
                    onTap: onTapForAdd,
                    labelText: 'عدد المقاعد',
                    hintText: numChair == 0
                        ? 'اضغط على اشارة + لحجز مقعد'
                        : 'تم اختيار $numChair  مقعد',
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomDropDownButton(
                  hintText: 'وسيلة الدفع',
                  listData: methodePaymint,
                  isSelected: isSelected,
                  onChanged: onChanged,
                  labelText: 'وسيلة الدفع',
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'السعر : ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                    Text(
                      '${price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColor.primaryColor, fontSize: 15.sp),
                    ),
                    Text(
                      ' ل.س ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'العمولة : ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                    Text(
                      numChair == null ? '0' : '${numChair! * 1000}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColor.primaryColor, fontSize: 15.sp),
                    ),
                    Text(
                      ' ل.س ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
