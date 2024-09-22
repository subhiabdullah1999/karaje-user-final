import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/Auth/checkCode_Controller.dart';
import '../../../core/class/handlingdataview.dart';

class CustomPinInput extends StatelessWidget {
  final TextEditingController otpController;

  CustomPinInput({
    required this.otpController, required Function(dynamic val) valid,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(checkCodeControllerImp());
    return GetBuilder<checkCodeControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget:  Container(
            alignment: Alignment.center,
            width: 90.w,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Transform.scale(
                scale: 1,
                child: Pinput(
                  onChanged: (pin) {
                    if (pin.length == 5) {
                      controller.checkCode(context);
                      print("finish");
                    }
                  },
                  length: 5,
                  controller: otpController,
                  animationCurve: Curves.easeInOutExpo,
                  focusedPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: Color(0xffEC441E),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));

  }
}
