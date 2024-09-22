import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormFieldWithoutWrite extends StatelessWidget {
  final String hintText;
  final String labelText;
  final void Function()? onTap;
  final IconData icon;
  final bool? isDense;
  const CustomTextFormFieldWithoutWrite({
    super.key,
    required this.hintText,
    required this.labelText,
    this.onTap,
    required this.icon,
    this.isDense,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          enabled: false,
          // readOnly: true,
          style: TextStyle(fontSize: 15.sp, color: Colors.black),
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: const BorderSide(color: Colors.black12)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: const BorderSide(color: Colors.black12)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: const BorderSide(color: Colors.black12)),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 12.sp, color: Colors.black54),
              isDense: true,
              label: Text(
                labelText,
                style: TextStyle(fontSize: 12.sp, color: Colors.black54),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 4.w, vertical: isDense != null ? 1.5.h : 1.h)),
        ),
        Positioned(
          left: 0.w,
          child: IconButton(
              splashColor: Colors.black12,
              onPressed: onTap,
              icon: Icon(
                icon,
                size: 18.sp,
                color: Colors.black38,
              )),
        ),
      ],
    );
  }
}
