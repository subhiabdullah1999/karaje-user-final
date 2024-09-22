import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/Auth/SignUp_Controller.dart';

class CustomDropDown extends StatelessWidget {
  final String labelText;

  //final TextEditingController controller;

  const CustomDropDown({
    super.key,
    required this.labelText,
    //required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final SignUpControllerImp signUpController = Get.put(SignUpControllerImp());

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.5.w),
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
                  Obx(
                    () => Text(
                      signUpController.selectedItem.value,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onPressed: () => _showDropdownMenu(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showDropdownMenu(BuildContext context) {
  final SignUpControllerImp signUpController = Get.put(SignUpControllerImp());
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final buttonRect = context.findRenderObject() as RenderBox;
  final Offset position =
      buttonRect.localToGlobal(Offset.zero, ancestor: overlay);

  // Get the width of the container
  final containerWidth = MediaQuery.of(context).size.width;

  showMenu(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.sp),
    ),
    context: context,
    position: RelativeRect.fromLTRB(
      containerWidth - position.dx - buttonRect.size.width, // left
      position.dy + 20.h, // top
      10.w, // right
      MediaQuery.of(context).size.height - position.dy, // bottom
    ),
    items: [
      PopupMenuItem(
        textStyle: TextStyle(
          height: 0.2.h,
          fontSize: 11.sp,
          fontFamily: 'Cairo',
          letterSpacing: 1,
        ),
        value: 'مدني',
        child: Text(
          'مدني',
          style: TextStyle(
            color: Colors.black,
            height: 0.2.h,
            fontSize: 13.sp,
            fontFamily: 'Cairo',
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      PopupMenuItem(
        textStyle: TextStyle(
          height: 0.2.h,
          fontSize: 11.sp,
          fontFamily: 'Cairo',
          letterSpacing: 1,
        ),
        value: 'طالب',
        child: Text(
          'طالب',
          style: TextStyle(
            color: Colors.black,
            height: 0.2.h,
            fontSize: 13.sp,
            fontFamily: 'Cairo',
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      PopupMenuItem(
        textStyle: TextStyle(
          height: 0.2.h,
          fontSize: 11.sp,
          fontFamily: 'Cairo',
          letterSpacing: 1,
        ),
        value: 'عسكري',
        child: Text(
          'عسكري',
          style: TextStyle(
            color: Colors.black,
            height: 0.2.h,
            fontSize: 13.sp,
            fontFamily: 'Cairo',
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
    initialValue: signUpController.selectedItem.value,
  ).then((value) {
    if (value != null) {
      signUpController.updateSelectedItem(value);
      print(signUpController.selectedItem);
    }
  });
}
