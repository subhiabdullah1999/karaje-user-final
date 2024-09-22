import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RowDataForCard extends StatelessWidget {
  final String numberBus;
  final List numChair;
  final String typeBus;
  final String price;

  const RowDataForCard(
      {super.key,
      required this.numberBus,
      required this.numChair,
      required this.typeBus,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'السعر',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                price,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'العمولة',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                "1000",
                // '${int.parse(price)*0.5+int.parse(price)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'الدرجة',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                typeBus,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'المقاعد',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    numChair.join('-'),
                    style: TextStyle(color: Colors.black, fontSize: 10.sp),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'رقم الباص',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                numberBus,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
