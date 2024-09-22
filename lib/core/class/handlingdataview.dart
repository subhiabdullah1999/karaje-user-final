import 'package:flutter/material.dart';
import 'package:karajaapp/core/class/statusrequest.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../constant/color.dart';
import '../constant/imgaeasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.Bus_Loading,
                width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(AppImageAsset.server,
                          width: 250, height: 250),
                      Text(
                        'لقد حدث عطل فني ',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp),
                      ),
                    ],
                  ))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(
                        AppImageAsset.noData,
                        width: 250,
                        height: 250,
                      ))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
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
          ))
        : widget;
  }
}
