import 'package:flutter/material.dart';
import 'package:karajaapp/core/constant/color.dart';
import 'package:karajaapp/core/constant/imgaeasset.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../controller/company/detailsCompanyController.dart';
import '../../../linkapi.dart';
import '../../widget/company/columnDataForConatct.dart';
import '../../widget/company/customcaruselSlider.dart';

class DetailsCompanyScreen extends StatelessWidget {
  const DetailsCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsCompanyController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const SizedBox(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                print('before .....................');
                Get.back();
                print('aftre .....................');
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15.sp,
              )),
        ],
        title: Text(
          'التفاصيل',
          style: TextStyle(color: Colors.black87, fontSize: 15.sp),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<DetailsCompanyController>(builder: (controller) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: ListView(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInImage.assetNetwork(
                        placeholder: AppImageAsset.logo,
                        image:
                            '${AppLink.imagesServer}logos/${controller.data['logo']}',
                        height: 5.h,
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'شركة  ${controller.data['name']}',
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    height: 20.h,
                    width: double.infinity,
                    child: FadeInImage.assetNetwork(
                      placeholder: AppImageAsset.logo,
                      image:
                          '${AppLink.imagesServer}logos/${controller.data['logo']}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // CustomcaruselSlider(imageLink: [
                  //   '${AppLink.imagesServer}logos/${controller.data['logo']}',
                  //   '${AppLink.imagesServer}logos/${controller.data['logo']}',
                  //   '${AppLink.imagesServer}logos/${controller.data['logo']}',
                  //   '${AppLink.imagesServer}logos/${controller.data['logo']}'
                  // ]),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'تاريخ شركة ${controller.data['name']} ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    // controller.data['description'],
                    '${controller.data['description']} ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black, fontSize: 11.sp, height: 2),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  height: 13.h,
                  width: 100.w,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        AppImageAsset.bottom,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 3.w, right: 3.w, top: 4.h),
                        child: ColumnDataForConatct(
                          link: '${controller.data['web']} ',
                          phoneNumber: '${controller.data['phone']} ',
                          supportNumber: '${controller.data['telephone']} ',
                          whatsappNumber: '${controller.data['whatsapp']} ',
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        );
      }),
    );
  }
}
