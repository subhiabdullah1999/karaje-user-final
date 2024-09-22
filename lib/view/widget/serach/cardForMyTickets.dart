import 'package:flutter/material.dart';
import 'package:karajaapp/view/widget/serach/customMatrerialButton.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';

class CardForMyTickets extends StatelessWidget {
  final bool isPendeing;
  final String date;
  final String linkImage;
  final String companyName;
  final String name;
  final bool? isWidget;
  final String data;
  final String startPlace;
  final String endPlace;
  final String startTime;
  final String endTime;
  final String period;
  final String priceTicket;
  final List numChair;
  final void Function()? onPressed;

  const CardForMyTickets(
      {super.key,
      required this.date,
      required this.startPlace,
      required this.endPlace,
      required this.startTime,
      required this.endTime,
      required this.period,
      required this.priceTicket,
      required this.numChair,
      required this.data,
      required this.companyName,
      required this.linkImage,
      required this.isPendeing,
      required this.name,
      this.isWidget, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isWidget == true ? 71.h : 61.h,
      width: 100.w,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.5.w)),
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.5.w),
              child: Column(children: [
                SizedBox(
                  height: 9.h,
                  width: 100.w,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 7.w,
                              height: 5.h,
                              child: Image.network(
                                  AppLink.imagesServer + linkImage)),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            companyName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Cairo',
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        date,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cairo',
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontSize: 11.sp),
                    ),
                    SizedBox(
                      height: 0.1.h,
                    ),
                    Text(
                      'المسافر',
                      style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Cairo',
                          fontSize: 10.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
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
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Cairo',
                                fontSize: 10.sp),
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
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Cairo',
                                fontSize: 10.sp),
                          ),
                          Text(
                            endTime,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Cairo',
                                fontSize: 11.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مدة الرحلة : ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontSize: 11.sp),
                    ),
                    Text(
                      period,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontFamily: 'Cairo',
                          fontSize: 13.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Apply here
                    children: [
                      Row(
                        children: [
                          Text(
                            'سعر الرحلة : ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Cairo',
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            '$priceTicket ',
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: 'Cairo',
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            'ل.س',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Cairo',
                              fontSize: 9.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 25.w,),
                      Row(
                        children: [
                          Text(
                            'رقم المقعد  : ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Cairo',
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            numChair.join('-'),
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Image.asset(AppImageAsset.chair),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Center(
                  child: PrettyQr(
                    typeNumber: 3,
                    size: 15.h,
                    data: data,
                    elementColor:
                        isPendeing == true ? Colors.blue : Colors.black,
                    errorCorrectLevel: QrErrorCorrectLevel.M,
                    roundEdges: true,
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  'رقم البطاقة : ${data.toString()}',
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontFamily: 'Cairo',
                      fontSize: 11.sp),
                ),
                isWidget == true
                    ? Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 1.h),
                            child: CustomMatrerialButton(
                              text: 'تحميل البطاقة',
                              onPressed:onPressed,
                            ),
                          )
                        ],
                      )
                    : const SizedBox(),
              ]))),
    );
  }
}
