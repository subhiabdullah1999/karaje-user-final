import 'package:flutter/material.dart';
import 'package:karajaapp/core/constant/imgaeasset.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CardForCompany extends StatelessWidget {
  final String linkImage;
  final String companyName;
  // final double rate;
  final void Function()? onPressed;

  const CardForCompany(
      {super.key,
      required this.companyName,
      // required this.rate,
      this.onPressed,
      required this.linkImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 35.h,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                placeholder: AppImageAsset.logo,
                image: AppLink.imagesServer + linkImage,
                height: 5.h,
                width: 10.w,
              ),
              SizedBox(
                width: 40.w,
                height: 5.h,
                child: Text(
                  companyName,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              // SizedBox(
              //   height: 1.h,
              // ),
              // SmoothStarRating(
              //     defaultIconData: Icons.star,
              //     allowHalfRating: false,
              //     onRatingChanged: null,
              //     starCount: 5,
              //     rating: rate,
              //     size: 12.sp,
              //     filledIconData: Icons.star,
              //     halfFilledIconData: Icons.star,
              //     color: AppColor.primaryColor,
              //     borderColor: Colors.black26,
              //     spacing: 0.0),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
