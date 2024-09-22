import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40.w, 15.h, 0, 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تسجيل الدخول',
            style: TextStyle(
              color: Colors.black,
              height: 0.2.h,
              fontSize: 19.sp,
              fontFamily: 'Cairo',
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 0.8.h,
          ), // Adjust the spacing as needed
          Text(
            'مرحباً بعودتك ',
            style: TextStyle(
              color: AppColor.grey,
              height: 0.2.h,
              fontSize: 13.sp,
              fontFamily: 'Cairo',
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
