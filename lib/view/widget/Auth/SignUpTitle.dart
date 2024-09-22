import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 4.h, 5.w, 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إنشاء حساب',
            style: TextStyle(
              color: Colors.black,
              height: 0.2.h,
              fontSize: 19.sp,
              fontFamily: 'Cairo',
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
