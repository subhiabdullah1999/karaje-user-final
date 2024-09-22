import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/view/screen/home/mainscreen.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/auth/checkCode.dart';
import '../../../data/datasource/remote/auth/signIn.dart';
import '../../core/constant/imgaeasset.dart';

// ignore: camel_case_types
abstract class checkCodeController extends GetxController {
  checkCode(BuildContext context);
  resendcode(BuildContext context);
  goToHome();
}

// ignore: camel_case_types
class checkCodeControllerImp extends checkCodeController {
  CheckCodeData checkCodeData = CheckCodeData(Get.find());
  SignInData loginData = SignInData(Get.find());
  late TextEditingController code;
  var isClick = false.obs;

  void updateisClick(bool value) {
    isClick.value = value;
    update();
  }
  RxInt secondsRemaining = 60.obs; // 1 minute
  GlobalKey<FormState> codeformstate = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }


  @override
  checkCode(BuildContext context) async {
    {
      //statusRequest = StatusRequest.loading;
      updateisClick(true);
      update();
      var response = await checkCodeData.postdata(code.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          myServices.sharedPreferences
              .setString("message", '${response['message']}');
          Get.offAll(MainScreen());
        }
      } else {
        updateisClick(false);
        update();
        // ignore: use_build_context_synchronously
        AwesomeDialog(
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
                  "تأكد من كود التحقق و أعد المحاولة \n لاحقا",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Cairo",
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ).show();
      }
      updateisClick(false);
      update();
    }
  }

  @override
  resendcode(BuildContext context) async {
    secondsRemaining.value=60;
    startCountdown();
    update();

    {
      //statusRequest = StatusRequest.loading;
      update();
      var response = await loginData
          .postdata('${myServices.sharedPreferences.getString("phone")}');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          Get.snackbar(
            'Verification code',
            '${response['data']['code']}',
            icon: const Icon(Icons.check_circle, color: Colors.green),
            duration: const Duration(seconds: 7),
            // backgroundColor: AppColor.orange, // Customize background color
            borderRadius: 10,
            margin: const EdgeInsets.all(10),
            animationDuration: const Duration(milliseconds: 500),
            shouldIconPulse: true,
            snackPosition: SnackPosition.TOP,
            barBlur: 20,
            isDismissible: true, // Allow user to dismiss snackbar
          );
        }
      } else {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
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
                  "تأكد من اتصالك بالانترنيت و أعد المحاولة \n لاحقا",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Cairo",
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ).show();
      }
      update();
    }
  }

  @override
  goToHome() {
    Get.offNamed(AppRoute.home);
  }

  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel(); // Stop the timer when countdown reaches 0
      }
    });
  }

  @override
  void onInit() {
    code = TextEditingController();
    startCountdown();
    super.onInit();
  }

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }
}
