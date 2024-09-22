import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HavaAccountText extends StatelessWidget {
  final VoidCallback onPressed;

  const HavaAccountText({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      child: Row(
        children: [
          Text(
            'هل لديك حساب سابق ؟ ',
            style: TextStyle(
              color: Color(0xff999DA3),
              height: 0.2.h,
              fontSize: 11.sp,
              fontFamily: 'Cairo',
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              'إدخل الآن ',
              style: TextStyle(
                color: Color(0xffEC441E),
                height: 0.2.h,
                fontSize: 11.sp,
                fontFamily: 'Cairo',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
