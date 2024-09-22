import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/core/constant/imgaeasset.dart';
import 'package:karajaapp/view/screen/home/home.dart';
import 'package:karajaapp/view/screen/home/mainscreen.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../constant/color.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle: const TextStyle(
          color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      middleText: "هل تريد الخروج من التطبيق",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              exit(0);
            },
            child: const Text("تاكيد")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child: const Text("الغاء"))
      ]);
  return Future.value(true);
}

Future<bool> onWillPop(context) async {
  final result = await AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.bottomSlide,
    customHeader: Transform.scale(
      scale: 0.18.h,
      child: Lottie.asset(
        AppImageAsset.registererror,
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Text(
            "هل تريد الخروج من التطبيق؟",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "Cairo",
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Get.back(canPop: false);
                },
                child: Container(
                  height: 50,
                  width: 75,
                  decoration: BoxDecoration(
                      color: AppColor.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "تراجع",
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  exit(0);
                },
                child: Container(
                  height: 50,
                  width: 75,
                  decoration: BoxDecoration(
                      color: AppColor.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "تاكيد",
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  ).show();
  // final result = await Get.defaultDialog(
  //   title: "تنبيه",
  //   titleStyle: const TextStyle(
  //     color: AppColor.primaryColor,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   middleText: "هل تريد الخروج من التطبيق؟",
  //   actions: [
  //     ElevatedButton(
  //       style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
  //       ),
  //       onPressed: () {
  //         exit(0); // Exit app
  //       },
  //       child: const Text("تاكيد"),
  //     ),
  //     ElevatedButton(
  //       style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
  //       ),
  //       onPressed: () {
  //         Get.back(canPop: false); // Stay in app
  //       },
  //       child: const Text("الغاء"),
  //     ),
  //   ],
  // );
  return result ?? false;
}

Future<bool> onWillPopGoToHome(context) async {
  final result = await Get.offAll(() => MainScreen());
  return result ?? false;
}
