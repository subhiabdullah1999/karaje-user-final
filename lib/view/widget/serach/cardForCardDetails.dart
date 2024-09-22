import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';

class CardForCardDetails extends StatelessWidget {
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
  final String price;
  const CardForCardDetails({super.key, required this.startPlace, required this.startTime, required this.endPlace, required this.endTime, required this.startPoint, required this.endPoint, required this.day, required this.hour, required this.minute, required this.period, required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 94.w,
      height: 27.h,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.5.w)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.w),
            child: Column(children: [
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
                              TextStyle(color: Colors.black, fontSize: 11.sp),
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
                              TextStyle(color: Colors.black, fontSize: 11.sp),
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
                        style: TextStyle(color: Colors.black, fontSize: 9.5.sp),
                      ),
                      Text(
                        startPoint,
                        style: TextStyle(color: Colors.black, fontSize: 9.5.sp),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'مدة الرحلة : ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 10.sp),
                      ),
                      Text(
                        period,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColor.primaryColor, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'الوصول إلى',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 9.5.sp),
                      ),
                      Text(
                        endPoint,
                        style: TextStyle(color: Colors.black, fontSize: 9.5.sp),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Column(
                children: [
                  Text(
                    'الرحلة سوف تنطلق بعد',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 0.4.h,
                  ),
                   Text(
                    ' $day يوم $hour ساعة $minute دقيقة ',
                    style: TextStyle(
                        color: AppColor.primaryColor, fontSize: 10.sp),
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}
