import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IconArrow extends StatelessWidget {
  const IconArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 4.w,
        ),
        Container(
          height: 7.h,
          width: 6.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(7.h / 2)),
          child: Icon(
            Icons.swap_vert,
            size: 20.sp,
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
      ],
    );
  }
}
