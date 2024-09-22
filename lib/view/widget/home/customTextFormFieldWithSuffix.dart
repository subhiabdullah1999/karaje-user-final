import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomTextFormFieldWithSuffix extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool? readOnly;
  final bool? enabled;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData icon;
  const CustomTextFormFieldWithSuffix(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.validator,
      required this.icon,
      this.readOnly,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      validator: validator,
      readOnly: readOnly == true ? true : false,
      style: TextStyle(fontSize: 15.sp, color: Colors.black),
      decoration: InputDecoration(
          suffixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: AppColor.primaryColor)),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12.sp, color: Colors.black54),
          isDense: true,
          label: Text(
            labelText,
            style: TextStyle(fontSize: 12.sp, color: Colors.black54),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w)),
    );
  }
}
