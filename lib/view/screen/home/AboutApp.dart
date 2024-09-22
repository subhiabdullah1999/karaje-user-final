import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/controller/homePage/about_app_controller.dart';
import 'package:karajaapp/core/constant/imgaeasset.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';
import '../../widget/Auth/AurhButtonWithoutChecBox.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AboutAppControllerImp controller = Get.put(AboutAppControllerImp());
    popDeletAccount() {
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
                "هل انت متأكد من حذف حسابك ؟",
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
                      Navigator.pop(context, true);
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
                      controller.deletAccount();
                    },
                    child: Container(
                      height: 50,
                      width: 75,
                      decoration: BoxDecoration(
                          color: AppColor.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "حذف",
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
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 35.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 16.h,
                    child: SizedBox(
                      height: 15.h,
                      child: Image.asset(
                        AppImageAsset.logo,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 29.h,
                    child: Text(
                      'كراجي ',
                      style: TextStyle(
                        color: AppColor.orange,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.h,
                    left: 5.w,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    child: Text(
                      'حول التطبيق',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 0),
              height: 60.h,
              child: Column(
                children: [
                  Text(
                    'مرحبًا بك في تطبيق كراجي الوجهة الرائدة لتجربة النقل السياحي السلسة والمميزة. يوفر تطبيقنا حلاً شاملاً لحجز الحافلات بكل سهولة ويُمكنك من الدفع الآمن عبر الإنترنت. استمتع برحلاتك بلا قلق، حيث يُمكنك أيضًا الحصول على تذاكرك الإلكترونية بسهولة. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'نسخة التطبيق 1.0.1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black45,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AuthButtonWithoutCheckBox(
                    buttonText: 'حذف الحساب ',
                    onPressed: () {
                      popDeletAccount();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
