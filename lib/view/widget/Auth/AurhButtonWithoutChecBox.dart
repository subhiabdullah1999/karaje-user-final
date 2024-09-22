import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/Auth/checkCode_Controller.dart';
import '../../../core/constant/color.dart';

class AuthButtonWithoutCheckBox extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  AuthButtonWithoutCheckBox({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final checkCodeControllerImp codeController =
        Get.put(checkCodeControllerImp());
    return codeController.isClick == true.obs
        ? CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 20.sp,
            child: const CircularProgressIndicator(color: AppColor.white),
          )
        : GestureDetector(
            onTap: onPressed,
            child: Container(
              alignment: Alignment.center,
              height: 7.5.h,
              width: 88.w,
              decoration: BoxDecoration(
                color: Color(0xffEC441E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  height: 0.2.h,
                  fontSize: 15.sp,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          );
  }
}
