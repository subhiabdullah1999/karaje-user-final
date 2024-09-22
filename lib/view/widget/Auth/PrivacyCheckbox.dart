import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/controller/update_app/update_app_controller.dart';
import 'package:karajaapp/view/screen/home/terms_and_conditions.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Auth/SignIn_Controller.dart';
import '../../../controller/Auth/SignUp_Controller.dart';
import '../../../core/constant/color.dart';

class PrivacyCheckbox extends StatelessWidget {
  final SignInControllerImp signInController = Get.put(SignInControllerImp());
  final SignUpControllerImp signUpController = Get.put(SignUpControllerImp());
  final UpdateAppControllerImp updateAppController =
      Get.put(UpdateAppControllerImp());

  PrivacyCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 8.h),
        child: Row(
          children: [
            Obx(
              () => Transform.scale(
                scale: 1.4,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  activeColor: AppColor.orange,
                  value: signInController.isChecked.value,
                  onChanged: (value) {
                    signInController.toggleChecked();
                    signUpController.toggleChecked();
                    updateAppController.toggleChecked();
                  },
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, 0.5.h),
              child: Text(
                'أوافق على سياسة الخصوصية ؟',
                style: TextStyle(
                  color: Colors.grey,
                  height: 0.2,
                  fontSize: 11.sp,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, 0.5.h),
              child: TextButton(
                onPressed: () {
                  Get.to(() => TermsAndConditions());
                  // Handle text button press
                },
                child: Text(
                  'قراءة المزيد',
                  style: TextStyle(
                    color: AppColor.orange,
                    height: 0.2,
                    fontSize: 11.sp,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
