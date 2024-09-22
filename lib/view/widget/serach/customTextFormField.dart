import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool? isDense;
  final bool? hideCursorAndBorder; // New parameter
  final TextInputType? textInputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key, // Add key parameter
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.validator,
    this.textInputType,
    this.isDense,
    this.hideCursorAndBorder, // Initialize the parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      showCursor: hideCursorAndBorder == true ? false : true,
      readOnly: hideCursorAndBorder == true ? true : false,
      enableInteractiveSelection: hideCursorAndBorder == true ? false : true,
      style: TextStyle(fontSize: 15.sp, color: Colors.black),
      decoration: InputDecoration(
        enabledBorder: hideCursorAndBorder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: Colors.black12),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: Colors.black12),
              ),
        focusedBorder: hideCursorAndBorder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: Colors.black12),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: AppColor.primaryColor),
              ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        border: hideCursorAndBorder == true
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: Colors.redAccent),
              ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.sp, color: Colors.black54),
        isDense: true,
        label: Text(
          labelText,
          style: TextStyle(fontSize: 12.sp, color: Colors.black54),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          vertical: isDense == true ? 1.5.h : 0.7.h,
          horizontal: 4.w,
        ),
      ),
    );
  }
}
