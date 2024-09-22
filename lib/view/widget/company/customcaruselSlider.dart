import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:karajaapp/core/constant/imgaeasset.dart';
import 'package:sizer/sizer.dart';

class CustomcaruselSlider extends StatelessWidget {
  final List<String> imageLink;

  const CustomcaruselSlider({super.key, required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: CarouselSlider.builder(
        options: CarouselOptions(
            autoPlay: true,
            height: 30.h,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            viewportFraction: 0.5,
            enlargeFactor: 0.63),
        itemBuilder: (context, index, realIndex) {
          return Container(
              color: Colors.black12,
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              child: FadeInImage.assetNetwork(
                placeholder: AppImageAsset.logo,
                image: imageLink[index],
                fit: BoxFit.cover,
              ));
        },
        itemCount: imageLink.length,
      ),
    );
  }
}
