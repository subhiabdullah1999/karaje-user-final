import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';
import 'customMatrerialButton.dart';

class CardForResultSearch extends StatelessWidget {
  final void Function()? onPressed;
  final String linkImage;
  final String companyName;
  final String date;
  final String startPlace;
  final String endPlace;
  final String startTime;
  final String endTime;
  final String period;
  final String priceTicket;
  final String numChair;

  const CardForResultSearch(
      {super.key,
      this.onPressed,
      required this.date,
      required this.startPlace,
      required this.endPlace,
      required this.startTime,
      required this.endTime,
      required this.period,
      required this.priceTicket,
      required this.numChair,
      required this.linkImage,
      required this.companyName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43.h,
      width: 100.w,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.5.w)),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.5.w),
              child: Column(children: [
                SizedBox(
                  height: 9.h,
                  width: 100.w,
                  child: Row(
                    children: [
                      Row(
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
                            companyName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.sp),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        date,
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                  child: FittedBox(
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
                                  TextStyle(color: Colors.black, fontSize: 10.sp),
                            ),
                            Text(
                              startTime,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12.sp),
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
                                  TextStyle(color: Colors.black, fontSize: 10.sp),
                            ),
                            Text(
                              endTime,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مدة الرحلة : ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 11.sp),
                    ),
                    Text(
                      period,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColor.primaryColor, fontSize: 13.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'سعر الرحلة : ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.black, fontSize: 10.sp),
                        ),
                        Text(
                          '$priceTicket ',
                          style: TextStyle(
                              color: AppColor.primaryColor, fontSize: 11.sp),
                        ),
                        Text(
                          'ل.س',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 9.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'المقاعد المتاحة : ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.black, fontSize: 10.sp),
                        ),
                        Text(
                          numChair,
                          style: TextStyle(
                              color: AppColor.primaryColor, fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Image.asset(AppImageAsset.chair)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: CustomMatrerialButton(
                    text: 'احجز',
                    onPressed: onPressed,
                  ),
                )
              ]))),
    );
  }
}
