import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/core/constant/color.dart';
import 'package:karajaapp/core/functions/alertdialogexitapp.dart';
import 'package:karajaapp/core/functions/alertexitapp.dart';
import 'package:karajaapp/view/screen/company/companiesScreen.dart';
import 'package:karajaapp/view/screen/home/Notifications.dart';
import 'package:karajaapp/view/screen/home/myReservationScreen.dart';
import 'package:karajaapp/view/screen/home/userInformationScreen.dart';
import 'package:karajaapp/view/screen/serach/searchScreen.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/homePage/Home.dart';
import '../../widget/home/EndDrawer.dart';
import 'home.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  List bottomnavigationbaritems = [
    'الرئيسية',
    'الشركات',
    'حجوزاتي',
    'ملفي',
  ];

  List icons = [
    EneftyIcons.home_3_outline,
    EneftyIcons.bank_outline,
    EneftyIcons.archive_book_outline,
    EneftyIcons.personalcard_outline,
  ];

  final List<Widget> screens = [
    const Home(),
    const CompaniesScreen(),
    const MyReservationScreen(),
    const UserInformationScreen(),
  ];
  List titleAppBar = [
    'كراجي',
    'الشركات',
    'حجوزاتي',
    'الملف الشخصي',
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeControllerImp());
    return Obx(
      () => Scaffold(
          resizeToAvoidBottomInset: false,
          key: controller.scaffoldKey,
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.sp)),
            onPressed: () {
              Get.to(() => const SearchScreen());
            },
            backgroundColor: AppColor.orange,
            child: const Icon(
              color: AppColor.white,
              EneftyIcons.search_status_2_outline,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              titleAppBar[controller.bottomNavIndex.value],
              style: const TextStyle(
                color: AppColor.black,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: controller.bottomNavIndex.value == 0
                ? IconButton(
                    icon: const Icon(
                      EneftyIcons.notification_outline,
                      color: AppColor.black,
                    ),
                    onPressed: () {
                      Get.to(() => const Notifications());
                    },
                  )
                : const SizedBox(),
            actions: controller.bottomNavIndex.value != 0
                ? [const SizedBox()]
                : [
                    IconButton(
                        icon: const Icon(
                          EneftyIcons.menu_outline,
                          color: AppColor.black,
                        ),
                        onPressed: () {
                          controller.openDrawer();
                        }),
                  ],
          ),
          endDrawer: const MyDrawer(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: icons.length,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? const Color(0xffEC441D) : Colors.black;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons[index],
                    size: 24,
                    color: color,
                  ),
                  SizedBox(height: 0.6.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      bottomnavigationbaritems[index],
                      maxLines: 1,
                      style: TextStyle(
                        color: color,
                        fontSize: 9.sp,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  )
                ],
              );
            },
            activeIndex: controller.bottomNavIndex.value,
            gapLocation: GapLocation.center,
            // Use GapLocation.end
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) {
              controller.bottomNavIndex.value = index;
            },
          ),
          body: WillPopScope(
              child: screens[controller.bottomNavIndex.value],
              onWillPop: () => onWillPop(context))),
    );
  }
}
