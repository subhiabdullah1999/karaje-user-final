import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';

class CustomContainer2 extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  CustomContainer2({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 7.h,
        width: 88.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.primaryColor,
            width: 1.sp,
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppColor.primaryColor,
            height: 0.2.h,
            fontSize: 15.sp,
            fontFamily: 'Cairo',
          ),
        ),
      ),
    );
  }
}
