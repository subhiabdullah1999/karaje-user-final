import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/controller/splash/splash_controller.dart';
import 'package:karajaapp/controller/update_app/update_app_controller.dart';
import 'package:karajaapp/core/class/handlingdataview.dart';
import 'package:karajaapp/core/functions/handingdatacontroller.dart';
import 'package:karajaapp/view/screen/update_app/update_app_screen.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/services/services.dart';
import '../Auth/signIn.dart';
import '../home/mainscreen.dart';

// ignore: must_be_immutable
class Splash extends StatelessWidget {
  MyServices myServices = Get.find();
  SplashControllerImp controllerImp = Get.put(SplashControllerImp());

  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateAppControllerImp());
    print("hhhhhhhhhhhhhhhhhhhgyrrrrrrrrrrrrrrrrrrrrrrr");
    print(myServices.sharedPreferences.get("userId"));
    print("hhhhhhhhhhhhhhhhhhhgyrrrrrrrrrrrrrrrrrrrrrrr");

    return GetBuilder<UpdateAppControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SafeArea(
              child: Stack(children: [
                AnimatedSplashScreen(
                  splashIconSize: Get.height,
                  splash: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 31.h,
                        child: Center(
                          child: Image.asset(
                            AppImageAsset.logo,
                            height: 20.h,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 51.h,
                        child: Center(
                          child: Text(
                            'كراجي',
                            style: TextStyle(
                              color: AppColor.orange,
                              height: 0.2.h,
                              fontSize: 25.sp,
                              fontFamily: 'Cairo',
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  nextScreen: myServices.sharedPreferences.getString("token") ==
                              null ||
                          myServices.sharedPreferences.getString("message") ==
                              null ||
                          myServices.sharedPreferences.get("userId") == null
                      ? SignIn()
                      : controller.data["app_v"] != "0.0.1"
                          ? UpdateApp()
                          : MainScreen(),
                  // : UpdateApp(),
                  splashTransition: SplashTransition.fadeTransition,
                  duration: 1000,
                ),
              ]),
            )));
  }
}
