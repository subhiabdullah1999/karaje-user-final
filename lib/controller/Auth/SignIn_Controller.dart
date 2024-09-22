import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/auth/signIn.dart';
import '../../../linkapi.dart';
import '../../core/functions/requestPermission.dart';

abstract class SignInController extends GetxController {
  signIn(BuildContext context);

  goToSignUp();
}

class SignInControllerImp extends SignInController {
  SignInData loginData = SignInData(Get.find());
  late TextEditingController phone;
  GlobalKey<FormState> form = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  var isChecked = false.obs;
  var isClick = false.obs;

  void updateisClick(bool value) {
    isClick.value = value;
    update();
  }

  void toggleChecked() {
    isChecked.toggle();
    update();
  }

  @override
  signIn(BuildContext context) async {
    if (!isPermission) {
      requestPermission();
    }
    if (isPermission && form.currentState!.validate()) {
      //statusRequest = StatusRequest.loading;
      updateisClick(true);
      update();
      var response = await loginData.postdata(phone.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          Get.toNamed(AppRoute.verfiyCode);
          print(response);
          myServices.sharedPreferences
              .setString("name", '${response['data']['Client']['name']}');
          myServices.sharedPreferences.setString(
              "idNumber", '${response['data']['Client']['idNumber']}');
          myServices.sharedPreferences
              .setString("userId", '${response['data']['Client']['id']}');
          myServices.sharedPreferences.setString("phone", phone.text);
          myServices.sharedPreferences
              .setString("token", '${response['data']['token']}');
          AppLink.token = response['data']['token'];
          AppLink.idNumber = response['data']['Client']['idNumber'];
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
            isDismissible: true,
          );
          print("hhhhhhhhhhhhhhhhhhhhhhhhhhhddddddddddddddddddddffffffffff");
          print(myServices.sharedPreferences.getString("userId"));
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
                  "تأكد من رقم الموبايل و أعد المحاولة \n لاحقا",
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
    } else {
      updateisClick(false);
      update();
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    requestPermission();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }
}
