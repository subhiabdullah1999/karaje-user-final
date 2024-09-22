import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/controller/update_app/update_app_controller.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Auth/SignIn_Controller.dart';
import '../../../controller/Auth/SignUp_Controller.dart';
import '../../../core/constant/color.dart';

class UpdateButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const UpdateButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final UpdateAppControllerImp updateController =
        Get.put(UpdateAppControllerImp());

    return GestureDetector(
      onTap: updateController.isChecked.value == true ? onPressed : null,
      child: Container(
        alignment: Alignment.center,
        height: 7.5.h,
        width: 88.w,
        decoration: BoxDecoration(
          color: updateController.isChecked.value == true
              ? AppColor.orange
              : Colors.grey,
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
