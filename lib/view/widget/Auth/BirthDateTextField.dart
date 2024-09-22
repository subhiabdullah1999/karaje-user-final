import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/Auth/SignUp_Controller.dart';
import '../../../core/class/handlingdataview.dart';

class BirthDateTextField extends StatelessWidget {
  final String labelText;
  final DateTime controller;

  const BirthDateTextField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final SignUpControllerImp signUpController =
    Get.put(SignUpControllerImp());
    return GetBuilder<SignUpControllerImp>(builder: (controller) {
      return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: GetBuilder<SignUpControllerImp>(builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: 13.h,
                    width: 90.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          labelText,
                          style: TextStyle(
                            color: Colors.black,
                            height: 0.2.h,
                            fontSize: 13.sp,
                            fontFamily: 'Cairo',
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 7.h,
                          width: 90.w,
                          child: GestureDetector(
                            onTap: () async {
                              controller.showCalender(context);
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 1.5.h, 4.w, 0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                  signUpController.selectedBirthDate.year==null?"مثال : ${signUpController.selectedBirthDate.year.toString().padLeft(2, '0')}-${signUpController.selectedBirthDate.month.toString().padLeft(2, '0')}-${signUpController.selectedBirthDate.day.toString().padLeft(2, '0')}":"${signUpController.selectedBirthDate.year.toString().padLeft(2, '0')}-${signUpController.selectedBirthDate.month.toString().padLeft(2, '0')}-${signUpController.selectedBirthDate.day.toString().padLeft(2, '0')}",
                                style:  TextStyle(
                                  fontFamily: 'Cairo',
                                  color: signUpController.selectedBirthDate.year==null? Colors.grey:Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),);
          }),);
    });
  }
}
