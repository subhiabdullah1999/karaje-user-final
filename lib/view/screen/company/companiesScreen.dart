import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/controller/company/companiesController.dart';
import 'package:karajaapp/core/class/handlingdataview.dart';
import 'package:karajaapp/view/screen/company/detailsCompanyScreen.dart';
import 'package:sizer/sizer.dart';
import '../../widget/company/cardForCompany.dart';
import '../../widget/serach/customMatrerialButton.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CompaniesController());
    return GetBuilder<CompaniesController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(children: [
            Padding(
              padding: EdgeInsets.only(bottom: 2.h, left: 2.5.w, right: 2.5.w),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.allCompanies?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 0.5.h),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.goToTripeCompany(
                              controller.allCompanies![index]['id'].toString());
                        },
                        child: CardForCompany(
                          linkImage:
                              'logos/${controller.allCompanies![index]['logo']}',
                          companyName: controller.allCompanies![index]['name'],
                          // rate: double.parse(controller.allCompanies![index]
                          //         ['rate']
                          //     .toString()),
                          onPressed: () {
                            Get.to(const DetailsCompanyScreen());
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 2.h,
                        left: 5.w,
                        right: 5.w,
                        child: Container(
                          height: 5.h,
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: CustomMatrerialButtonForDetails(
                            text: 'التفاصيل',
                            onPressed: () {
                              Get.to(const DetailsCompanyScreen(),
                                  arguments: controller.allCompanies![index]);
                            },
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ]));
    });
  }
}
