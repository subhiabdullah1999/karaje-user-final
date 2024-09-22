import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/Auth/AurhButtonWithoutChecBox.dart';
import '../../widget/Auth/CustomPinInput.dart';
import '../../widget/Auth/CustomTextField.dart';
import '../../widget/home/CustomContainer2.dart';

class Cach2 extends StatelessWidget {
  final otpController = TextEditingController();
  final phoneController = TextEditingController();

  Cach2({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            ' الدفع',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              EneftyIcons.arrow_left_3_outline,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SizedBox(
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Image.asset(
                  AppImageAsset.syriatelcach,
                  width: 80.w,
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                SizedBox(
                  height: 14.h,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: CustomTextField(
                      valid: (val) {
                        return validInput(val!, 10, 10, "phone");
                      },
                      textfieldcontroller: phoneController,
                      keyboardType: TextInputType.phone,
                      labelText: 'رقم الهاتف',
                      hintText: ' رقم الهاتف 09xxxxxxxx',
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(33.w, 0.h),
                  child: Text(
                    'رمز التحقق',
                    style: TextStyle(
                      color: Colors.black,
                      height: 0.2.h,
                      fontSize: 15.sp,
                      fontFamily: 'Cairo',
                      letterSpacing: 1.5,
                      // fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(14.w, 2.h),
                  child: Text(
                    'أدخل رمز التحقق الذي أُرسل إليك',
                    style: TextStyle(
                      color: const Color(0xff555555),
                      height: 0.2.h,
                      fontSize: 13.sp,
                      fontFamily: 'Cairo',
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0.w, 5.h),
                  child: Container(
                    height: 10.h,
                    child: CustomPinInput(
                      otpController: otpController,
                      valid: (val) {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  'إعادة إرسال رمز التحقق بعد 10 دقائق',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    height: 0.2.h,
                    fontSize: 13.sp,
                    fontFamily: 'Cairo',
                    // letterSpacing: 1,
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'إعادة إرسال رمز التحقق ',
                      style: TextStyle(
                        color: Color(0xff999DA3),
                        height: 0.2.h,
                        fontSize: 11.sp,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                AuthButtonWithoutCheckBox(
                  buttonText: 'تأكيد ',
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                CustomContainer2(
                  buttonText: 'إلغاء ',
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
