import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:sizer/sizer.dart';

class ImageQR extends StatelessWidget {
  final String data;
  const ImageQR({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 94.w,
        height: 20.h,
        child: Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.w),
              child: Center(
                child: PrettyQr(
                  typeNumber: 3,
                  size: 14.h,
                  data: data,
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  roundEdges: true,
                ),
              ),
            )));
  }
}
