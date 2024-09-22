import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/core/constant/imgaeasset.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constant/color.dart';

class CallUs extends StatelessWidget {
  const CallUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 35.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -30.h,
                    child: Container(
                      height: 55.h,
                      width: 125.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [AppColor.orangeFun1, AppColor.orangeFun2],
                        ),
                        borderRadius: BorderRadius.circular(200.sp),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 7.h,
                    child: SizedBox(
                      height: 30.h,
                      child: Image.asset(
                        AppImageAsset.aboutus,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.h,
                    left: 5.w,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    child: Text(
                      'إتصل بنا',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      await launchUrl(
                          Uri.parse("https://wa.me/963948882088?text="));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                              color: AppColor.greyLight, width: 0.5.w)),
                      child: ListTile(
                        title: Text(
                          'WhatsApp',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                        subtitle: const Text(
                          '+963948882088',
                          style: TextStyle(color: Colors.black),
                        ),
                        leading: Image.asset(
                          AppImageAsset.whatsapp,
                          height: 5.h,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColor.greyLight,
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(3.w, 1.5.h, 3.w, 1.5.h),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10.sp),
                  //       border: Border.all(
                  //           color: AppColor.greyLight, width: 0.5.w)),
                  //   child: ListTile(
                  //     title: Text(
                  //       'Facebook',
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontFamily: 'Cairo',
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 12.sp,
                  //       ),
                  //     ),
                  //     subtitle: const Text(
                  //       'Karaji Syria',
                  //       style: TextStyle(color: Colors.black),
                  //     ),
                  //     leading: Image.asset(
                  //       AppImageAsset.facebook,
                  //       height: 5.h,
                  //     ),
                  //     trailing: const Icon(
                  //       Icons.arrow_forward_ios_sharp,
                  //       color: AppColor.greyLight,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+963948882088"));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(3.w, 0.h, 3.w, 1.5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                              color: AppColor.greyLight, width: 0.5.w)),
                      child: ListTile(
                        title: Text(
                          'موبايل',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                        subtitle: const Text(
                          '+963948882088',
                          style: TextStyle(color: Colors.black),
                        ),
                        leading: Image.asset(
                          AppImageAsset.phone,
                          height: 5.h,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColor.greyLight,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await launchUrl(Uri.parse("sms:+963948882088"));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(3.w, 0.h, 3.w, 1.5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                              color: AppColor.greyLight, width: 0.5.w)),
                      child: ListTile(
                        title: Text(
                          'sms',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                        subtitle: const Text(
                          '+963948882088',
                          style: TextStyle(color: Colors.black),
                        ),
                        leading: const Icon(
                          Icons.sms_outlined,
                          color: AppColor.red,
                          size: 40,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColor.greyLight,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await launchUrl(
                          Uri.parse("mailto:subhiabdullah1999@gmail.com"));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 3.w,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                              color: AppColor.greyLight, width: 0.5.w)),
                      child: ListTile(
                        title: Text(
                          'ايميل',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                        subtitle: const Text(
                          'subhiabdullah1999@gmail.com',
                          style: TextStyle(color: Colors.black),
                        ),
                        leading: const Icon(
                          Icons.email_outlined,
                          color: AppColor.red,
                          size: 40,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColor.greyLight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  // Text(
                  //   'نسخة التطبيق 1.0.1',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     color: Colors.black45,
                  //     fontFamily: 'Cairo',
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 12.sp,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
