import 'package:flutter/material.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomTextFormFieldWithMask extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool? enabled;
  const CustomTextFormFieldWithMask(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.validator,
      this.onTap,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      validator: validator,
      style: TextStyle(
          fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.black54),
      inputFormatters: [MaskInputFormatter(mask: '####/##/##')],
      decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(Icons.calendar_month_outlined,
                size: 20.sp, color: Colors.black54),
          ),
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
          contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w)),
    );
  }
}
