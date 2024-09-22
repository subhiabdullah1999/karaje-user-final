import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class ColumnDataForConatct extends StatelessWidget {
  final String phoneNumber;
  final String link;
  final String supportNumber;
  final String whatsappNumber;

  const ColumnDataForConatct(
      {super.key,
      required this.phoneNumber,
      required this.link,
      required this.supportNumber,
      required this.whatsappNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FaIcon(
                    Icons.support_agent_outlined,
                    color: Colors.white,
                    size: 17.sp,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    supportNumber,
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.7,
                      fontSize: 11.sp,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.white,
                    size: 17.sp,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    whatsappNumber,
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.7,
                      fontSize: 11.sp,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FaIcon(
                    Icons.phone,
                    color: Colors.white,
                    size: 17.sp,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    phoneNumber,
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.7,
                      fontSize: 11.sp,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FaIcon(
                    Icons.language,
                    color: Colors.white,
                    size: 17.sp,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    width: 38.w,
                    child: Text(
                      link,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.7,
                        fontSize: 11.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
