import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';

class NoInternetWidget extends StatelessWidget {
  final Widget widget;
  const NoInternetWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return InternetWidget(
      online: widget,
      offline: FullScreenWidget(
          child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          backgroundBlendMode: BlendMode.plus,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16.0),
            ),
            height: 100.h,
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  AppImageAsset.offline,
                  width: 60.w,
                  height: 30.h,
                ),
                Text(
                  'انقطع الأتصال بالانترنت',
                  style: TextStyle(fontSize: 20.sp, fontFamily: 'cairo'),
                ),
              ],
            ),
          ),
        ),
      )),
      whenOffline: () => print('No Internet'),
      whenOnline: () => print('Connected to internet'),
      loadingWidget: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppImageAsset.Bus_Loading,
            width: 80.w,
            height: 13.h,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'انتظر من فضلك',
            style: TextStyle(
              color: AppColor.primaryColor,
              height: 0.2.h,
              fontSize: 18.sp,
              fontFamily: 'Cairo',
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      )),
    );
  }
}
