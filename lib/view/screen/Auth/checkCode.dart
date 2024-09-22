import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/core/class/handlingdataview.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Auth/checkCode_Controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/services/services.dart';
import '../../widget/Auth/AurhButtonWithoutChecBox.dart';
import '../../widget/Auth/CheckBoxTitle.dart';
import '../../widget/Auth/CustomPinInput.dart';

// ignore: must_be_immutable
class CheckCode extends StatelessWidget {
  MyServices myServices = Get.find();

  CheckCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(checkCodeControllerImp());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: GetBuilder<checkCodeControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 75.w, top: 8.h),
                          height: 5.5.h,
                          width: 11.w,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 13.sp,
                            ),
                          ),
                        ),
                        CheckBoxTitle(),
                        Form(
                          key: controller.codeformstate,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: CustomPinInput(
                              otpController: controller.code,
                              valid: (val) {
                                return validInput(val!, 5, 5, "code");
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 11.h),
                          child: AuthButtonWithoutCheckBox(
                            buttonText: 'تأكيد ',
                            onPressed: () {
                              controller.checkCode(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'إعادة إرسال رمز التحقق بعد ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColor.black,
                                  height: 0.2.h,
                                  fontSize: 13.sp,
                                  fontFamily: 'Cairo',
                                  // letterSpacing: 1,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  controller.formatTime(
                                      controller.secondsRemaining.value),
                                  style: TextStyle(
                                    color: AppColor.black,
                                    height: 0.2.h,
                                    fontSize: 13.sp,
                                    fontFamily: 'Cairo',
                                    // letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Obx(
                          () {
                            final isCountdownZero =
                                controller.secondsRemaining.value == 0;
                            return GestureDetector(
                              onTap: () {
                                isCountdownZero
                                    ? controller.resendcode(context)
                                    : null;
                              },
                              child: Text(
                                'إعادة إرسال رمز التحقق',
                                style: TextStyle(
                                  color: isCountdownZero
                                      ? AppColor.orange
                                      : AppColor.grey,
                                  height: 0.2.h,
                                  fontSize: 11.sp,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
