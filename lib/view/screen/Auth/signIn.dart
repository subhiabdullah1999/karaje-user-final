import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/core/class/handlingdataview.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Auth/SignIn_Controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/Auth/AuthButton.dart';
import '../../widget/Auth/CustomTextField.dart';
import '../../widget/Auth/PrivacyCheckbox.dart';
import '../../widget/Auth/SignInTitle.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: GetBuilder<SignInControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              key: controller.form,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SignInTitle(),
                    CustomTextField(
                      valid: (val) {
                        return validInput(val!, 10, 10, "phone");
                      },
                      textfieldcontroller: controller.phone,
                      keyboardType: TextInputType.phone,
                      labelText: 'رقم الهاتف',
                      hintText: ' مثال : 09xxxxxxxxx',

                    ),
                    PrivacyCheckbox(),
                    AuthButton(
                      buttonText: 'تسجيل الدخول',
                      onPressed: () async {
                        controller.signIn(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 23.h),
                      child: TextButton(
                        onPressed: () {
                          controller.goToSignUp();
                        },
                        child: Text(
                          'إنشاء حساب',
                          style: TextStyle(
                            color: AppColor.orange,
                            height: 0.2.h,
                            fontSize: 11.sp,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
