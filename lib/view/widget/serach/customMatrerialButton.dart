import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomMatrerialButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomMatrerialButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 7.h,
        minWidth: 100.w,
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 13.sp, color: Colors.white),
        ));
  }
}

class CustomMatrerialButtonWithBorder extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomMatrerialButtonWithBorder(
      {super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 7.h,
        minWidth: 100.w,

        // color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
            side: const BorderSide(color: AppColor.primaryColor, width: 1)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 13.sp, color: AppColor.primaryColor),
        ));
  }
}

class CustomMatrerialButtonForDetails extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomMatrerialButtonForDetails(
      {super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 5.h,
        minWidth: 26.w,
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 11.sp, color: Colors.white),
        ));
  }
}
