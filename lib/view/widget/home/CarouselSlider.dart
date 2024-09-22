import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/homePage/Home.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/home/cacheImage.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: Container(
          height: 23.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 30.h,
              autoPlay: true,
              enableInfiniteScroll: true,
              //viewportFraction: 0.7,
              aspectRatio: 39 / 19,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: 0.8,
              enlargeFactor: 0.63,
            ),
            itemBuilder: (context, index, realIndex) {
              return Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 90.w,
                  height: 18.h,
                  margin: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 3.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(5, 6),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomCacheImage(
                    imageUrl:
                        '${AppLink.imageststatic}/${controller.slides[index]['slide']}',
                  ));
            },
            itemCount: controller.slides.length,
          ),
        ),
      ),
    );
  }
}
