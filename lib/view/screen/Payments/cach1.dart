import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/Auth/AurhButtonWithoutChecBox.dart';
import '../../widget/home/CustomContainer2.dart';

class Cach1 extends StatelessWidget {
  const Cach1({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            ' الدفع',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              EneftyIcons.arrow_left_3_outline,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        body: SizedBox(
          width: 100.w,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Icon(
                Icons.info_outline,
                color: AppColor.primaryColor,
                size: 85.sp,
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 100.w,
                child: Text(
                  textAlign: TextAlign.center,
                  'تذكير \n يرجى الحضور إلى المكتب وتثبيت \n الحجز قبل موعد الرحلة بساعة وإلا \n سوف نكون متأسفين لإلغاء \n رحلتكم \n \n شاكرين تفهمكم',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Cairo',
                    fontSize: 15.sp,
                    letterSpacing: 1.5,
                    height: 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              AuthButtonWithoutCheckBox(
                buttonText: 'تأكيد ',
                onPressed: () {
                  Get.offNamed(AppRoute.cach2);
                },
              ),
              SizedBox(
                height: 2.5.h,
              ),
              CustomContainer2(
                buttonText: 'إلغاء ',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
