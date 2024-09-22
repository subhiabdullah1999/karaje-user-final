import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import '../../../controller/DropDownController.dart';
import '../../../core/constant/imgaeasset.dart';

class CustomDropDownButton3 extends StatelessWidget {
  final List listData;
  final String hintText;
  final String labelText;
  final bool? isDense;
  final void Function(Object?)? onChanged;
  final isSelected;
  const CustomDropDownButton3({
    super.key,
    required this.listData,
    required this.hintText,
    this.isSelected,
    this.onChanged,
    required this.labelText,
    this.isDense,
  });

  @override
  Widget build(BuildContext context) {
    DropDownController dropDownController = Get.put(DropDownController());

    return TextFormField(
      readOnly: true,
      style: TextStyle(fontSize: 12.sp),
      decoration: InputDecoration(
          suffixIconConstraints:
              BoxConstraints(minWidth: 100.w, maxHeight: 6.5.h),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: DropdownButton(
                dropdownColor: Colors.white,
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(10.sp),
                iconSize: 33,
                icon: const Icon(
                  Icons.expand_more,
                  color: Colors.black26,
                ),
                // padding: EdgeInsetsDirectional.only(end: 1.7.w),
                hint: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    hintText,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                isExpanded: true,
                value: isSelected,
                items: listData
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Text(
                              e,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                          onTap: () {
                            dropDownController.selectedValue.value = e;
                            onChanged?.call(
                                e); // Call the provided onChanged callback
                            // Get.back(); // Close the dropdown list
                          },
                        ))
                    .toList(),
                onChanged: onChanged),
          ),
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
          hintStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black54),
          isDense: true,
          label: Text(
            labelText,
            style: TextStyle(fontSize: 12.sp, color: Colors.black54),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 4.w, vertical: isDense != null ? 1.5.h : 0.7.h)),
    );
  }
}
