import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/search/travelDetailsController.dart';
import '../../widget/Auth/AurhButtonWithoutChecBox.dart';
import '../../widget/home/ChairSelectionWidget.dart';
import '../../widget/home/ReservationStatusRow.dart';

class SeatReserve extends StatelessWidget {
  const SeatReserve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TravelDetailsController());
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'حجز مقعد',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              EneftyIcons.arrow_left_3_outline,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: ListView(
          children: [
            const ReservationStatusRow(),
            SizedBox(
              height: 85.h,
              width: 100.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    child: SizedBox(
                      height: 75.h,
                      width: 85.w,
                      child: Builder(builder: (BuildContext context) {
                        return const ChairSelectionWidget();
                      }),
                    ),
                  ),
                  Positioned(
                    bottom: 1.h,
                    child: AuthButtonWithoutCheckBox(
                      buttonText: 'تأكيد',
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
