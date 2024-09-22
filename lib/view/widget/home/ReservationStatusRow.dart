import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReservationStatusRow extends StatelessWidget {
  const ReservationStatusRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8.w),
        const StatusCircle(backgroundColor: Color(0xffE50909)),
        SizedBox(width: 3.w),
        const StatusText(text: 'محجوز'),
        SizedBox(width: 13.w),
        const StatusCircle(backgroundColor: Color(0xffEBEFF3)),
        SizedBox(width: 3.w),
        const StatusText(text: 'غير محجوز'),
        SizedBox(width: 13.w),
        const StatusCircle(backgroundColor: Color(0xff2F4C78)),
        SizedBox(width: 3.w),
        const StatusText(text: 'مكانك'),
      ],
    );
  }
}

class StatusCircle extends StatelessWidget {
  final Color backgroundColor;

  const StatusCircle({super.key, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 6.sp,
      backgroundColor: backgroundColor,
    );
  }
}

class StatusText extends StatelessWidget {
  final String text;

  const StatusText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'Cairo',
      ),
    );
  }
}
