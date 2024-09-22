import 'package:flutter/material.dart';
import 'package:karajaapp/core/class/handlingdataview.dart';
import 'package:karajaapp/view/screen/home/mainscreen.dart';
import 'package:karajaapp/view/screen/update_app/update_app_screen.dart';
import 'package:karajaapp/view/widget/serach/customdropdown3.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/search/searchController.dart';
import '../../../core/class/crud.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/serach/customDropDownbotton.dart';
import '../../widget/serach/customDropDownbotton2.dart';
import '../../widget/serach/customMatrerialButton.dart';
import '../../widget/serach/customTextFormFieldWithMask.dart';
import '../../widget/serach/iconArrow.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Crud());
    Get.put(SerachController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => MainScreen());
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15.sp,
              )),
        ],
        title: Text(
          'بحث عن رحلة',
          style: TextStyle(color: Colors.black, fontSize: 15.sp),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SerachController>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                  width: 94.w,
                  height: 62.h,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.5.w)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
                      child: Form(
                        key: controller.formstate,
                        child: Column(
                          children: [
                            CustomDropDownButton3(
                              isDense: true,
                              hintText: 'اختر نقطة الانطلاق',
                              listData: controller.listCity,
                              isSelected: controller.selectedStartCity,
                              onChanged: (val) {
                                controller.selectCity(val, 1);
                              },
                              labelText: 'من',
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  controller.switchBetweenControllers();
                                },
                                child: const IconArrow()),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            CustomDropDownButton3(
                              isDense: true,
                              hintText: 'اختر نقطة الوصول',
                              listData: controller.listCity,
                              isSelected: controller.selectedEndCity,
                              onChanged: (val) {
                                controller.selectCity(val, 2);
                              },
                              labelText: 'إلى',
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomTextFormFieldWithMask(
                              controller: controller.date!,
                              hintText: controller.date!.text.toString(),
                              labelText: 'تاريخ الرحلة',
                              validator: (val) {
                                return validInput(val!, 1, 15, 'none');
                              },
                              onTap: () {
                                controller.showCalendar(context);
                              },
                            ),
                            // SizedBox(
                            //   height: 5.h,
                            // ),
                            // CustomTextFormFieldWithMask(
                            //   controller: controller.time!,
                            //   hintText: controller.time2.toString(),
                            //   labelText: 'وقت الرحلة',
                            //   validator: (val) {
                            //     return validInput(val!, 1, 15, 'none');
                            //   },
                            //   onTap: () {
                            //     controller.showSelectTime(context);
                            //   },
                            // ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: CustomMatrerialButton(
                                  text: 'بحث',
                                  onPressed: () {
                                    controller.seaech();
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
