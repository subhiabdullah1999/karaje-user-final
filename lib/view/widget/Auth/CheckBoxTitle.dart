import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CheckBoxTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 25.w,top: 2.h,right: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'رمز التحقق',
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
            'أدخل رمز التحقق الذي أُرسل إليك',
            style: TextStyle(
              color: Color(0xff555555),
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
