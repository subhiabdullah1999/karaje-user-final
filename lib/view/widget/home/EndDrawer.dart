import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/controller/homePage/userInformationController.dart';
import 'package:karajaapp/core/constant/color.dart';
import 'package:karajaapp/core/services/services.dart';
import 'package:karajaapp/view/screen/home/CallUs.dart';
import 'package:karajaapp/view/screen/home/terms_and_conditions.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constant/routes.dart';
import '../../screen/home/AboutApp.dart';
import '../../screen/home/switchScreen.dart';
import 'EndDrawerListTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    Get.put(UserInformationController());
    return SafeArea(
        child: GetBuilder<UserInformationController>(
      builder: (userInformationController) => Drawer(
        width: 74.w,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 2.h,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.person,
                    color: Colors.black54,
                    size: 30.sp,
                  ),
                ),
                title: const Text(
                  'مرحبا',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Cairo',
                  ),
                ),
                trailing: userInformationController.data["status"] == 1
                    ? Column(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColor.primaryColor,
                          ),
                          Text("حساب موثق")
                        ],
                      )
                    : SizedBox(),
                subtitle: Text(
                  '${myServices.sharedPreferences.getString('name')}',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                onTap: () {
                  // Add your action for Item 1 here.
                },
              ),
              Divider(thickness: 0.2.h),

              EndDrawerListTile(
                title: 'الرئيسية',
                onPressed: () {
                  Get.back();
                },
                icon: EneftyIcons.home_3_outline,
              ),
              EndDrawerListTile(
                title: 'حجوزاتي',
                onPressed: () {
                  Get.to(() => SwitchScreen(
                        indexScreen: 1,
                      ));
                },
                icon: EneftyIcons.note_4_outline,
              ),
              EndDrawerListTile(
                title: 'الشركات',
                onPressed: () {
                  Get.to(() => SwitchScreen(
                        indexScreen: 0,
                      ));
                },
                icon: EneftyIcons.bank_outline,
              ),
              EndDrawerListTile(
                title: 'الملف الشخصي',
                onPressed: () {
                  Get.to(() => SwitchScreen(
                        indexScreen: 2,
                      ));
                },
                icon: EneftyIcons.profile_circle_outline,
              ),
              EndDrawerListTile(
                title: 'إتصل بنا',
                onPressed: () async {
                  // await launchUrl(Uri.parse("tel:+963948882088"));
                  Get.to(() => const CallUs());
                },
                icon: EneftyIcons.a_24_support_outline,
              ),
              EndDrawerListTile(
                title: 'سياسة الخصوصية والاستخدام',
                onPressed: () {
                  Get.to(() => TermsAndConditions());
                },
                icon: EneftyIcons.stickynote_outline,
              ),
              EndDrawerListTile(
                title: 'حول التطبيق',
                onPressed: () {
                  Get.to(() => const AboutApp());
                },
                icon: EneftyIcons.info_circle_outline,
              ),
              EndDrawerListTile(
                title: 'تسجيل الخروج ',
                onPressed: () {
                  Get.offNamed(AppRoute.signIn);
                  myServices.sharedPreferences.clear();
                },
                icon: EneftyIcons.logout_outline,
              ),
              Divider(thickness: 0.2.h),
              SizedBox(
                height: 1.h,
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
              // Add more items as needed.
            ],
          ),
        ),
      ),
    ));
  }
}
