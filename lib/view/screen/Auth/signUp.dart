import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/core/constant/color.dart';
import 'package:karajaapp/core/constant/imgaeasset.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Auth/SignUp_Controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/Auth/AuthButton.dart';
import '../../widget/Auth/BirthDateTextField.dart';
import '../../widget/Auth/CustomDropDown.dart';
import '../../widget/Auth/CustomTextField.dart';
import '../../widget/Auth/CustomidPhoto.dart';
import '../../widget/Auth/CustomproofPhoto.dart';
import '../../widget/Auth/HavaAccountText.dart';
import '../../widget/Auth/PrivacyCheckbox.dart';
import '../../widget/Auth/SignUpTitle.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const SignUpTitle(),
                Form(
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.form,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextField(
                        valid: (val) {
                          return validInput(val!, 2, 50, "username");
                        },
                        textfieldcontroller: controller.name,
                        labelText: 'اسم المستخدم',
                        hintText: 'الاسم',
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        valid: (val) {
                          return validInput(val!, 10, 10, "phone");
                        },
                        textfieldcontroller: controller.phone,
                        keyboardType: TextInputType.phone,
                        labelText: 'رقم الهاتف',
                        hintText: ' رقم الهاتف 09xxxxxxxx',
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        valid: (val) {
                          return validInput(val!, 11, 11, "id");
                        },
                        textfieldcontroller: controller.idNumber,
                        keyboardType: TextInputType.phone,
                        labelText: 'الرقم الوطني ',
                        hintText: ' أدخل رقم الهوية الوطني',
                      ),
                      BirthDateTextField(
                        labelText: 'تاريخ الولادة ',
                        controller: controller.selectedBirthDate,
                      ),
                    ],
                  ),
                ),
                const CustomDropDown(
                  labelText: 'نوع المستخدم',
                ),
                const CustomproofPhoto(
                  labelText: 'الأوراق الثبوتية ',
                ),
                controller.selectedItem == 'طالب'
                    ? const CustomidPhoto(
                        labelText: 'البطاقة الجامعية',
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 1.h,
                ),
                PrivacyCheckbox(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: AuthButton(
                    buttonText: 'سجل',
                    onPressed: () {
                      controller.signUp(context);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HavaAccountText(
                      onPressed: () {
                        controller.goToSignIn();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
