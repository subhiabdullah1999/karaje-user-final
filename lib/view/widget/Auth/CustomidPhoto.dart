import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/Auth/SignUp_Controller.dart';

class CustomidPhoto extends StatelessWidget {
  final String labelText;

  const CustomidPhoto({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return GetBuilder<SignUpControllerImp>(builder: (controller) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.5.w),
        height: 15.h,
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
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.Imagefileuniv == null
                          ? 'أضف صورة البطاقة الجامعية'
                          : 'تمت اضافة الصورة ',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: controller.Imagefileuniv == null
                            ? Colors.grey
                            : Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () async {
                        controller.pickImageuniv(ImageSource.gallery);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
