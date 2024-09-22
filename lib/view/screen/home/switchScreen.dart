import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/view/screen/company/companiesScreen.dart';
import 'package:karajaapp/view/screen/home/myReservationScreen.dart';
import 'package:karajaapp/view/screen/home/userInformationScreen.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SwitchScreen extends StatelessWidget {
  final int indexScreen;
  List bottomnavigationbaritems = [
    'الرئيسية',
    'الشركات',
    'حجوزاتي',
    'ملفي',
  ];

  final List<Widget> screens = [
    const CompaniesScreen(),
    const MyReservationScreen(),
    const UserInformationScreen(),
  ];

  List titleAppBar = [
    'الشركات',
    'حجوزاتي',
    'الملف الشخصي',
  ];

  SwitchScreen({super.key, required this.indexScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexScreen],
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          titleAppBar[indexScreen],
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15.sp,
              )),
        ],
      ),
    );
  }
}
