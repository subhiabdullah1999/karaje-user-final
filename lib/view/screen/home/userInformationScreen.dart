import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:karajaapp/controller/homePage/about_app_controller.dart';
import 'package:karajaapp/core/class/handlingdataview.dart';
import 'package:karajaapp/core/constant/color.dart';
import 'package:karajaapp/core/constant/imgaeasset.dart';
import 'package:karajaapp/core/functions/validinput.dart';
import 'package:karajaapp/view/widget/serach/customDropDownbotton.dart';
import 'package:karajaapp/view/widget/serach/customMatrerialButton.dart';
import 'package:karajaapp/view/widget/serach/customTextFormFieldWithMask.dart';
import 'package:karajaapp/view/widget/serach/customTextFormFieldWithoutWrite.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../controller/homePage/userInformationController.dart';
import '../../widget/home/customTextFormFieldWithSuffix.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserInformationController());
    AboutAppControllerImp controlleraboutApp = Get.put(AboutAppControllerImp());

    popDeletAccount() {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.bottomSlide,
        customHeader: Transform.scale(
          scale: 0.18.h,
          child: Lottie.asset(
            AppImageAsset.registererror,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            children: [
              Text(
                "هل انت متأكد من حذف حسابك ؟",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Cairo",
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      height: 50,
                      width: 75,
                      decoration: BoxDecoration(
                          color: AppColor.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "تراجع",
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controlleraboutApp.deletAccount();
                    },
                    child: Container(
                      height: 50,
                      width: 75,
                      decoration: BoxDecoration(
                          color: AppColor.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "حذف",
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ).show();
    }

    return GetBuilder<UserInformationController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.5.w),
            child: ListView(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.black12,
                      child: Icon(
                        Icons.person,
                        color: Colors.black54,
                        size: 30.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      controller.data['name'] ?? '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormFieldWithSuffix(
                  enabled: controller.data["status"] == 1 ? false : true,
                  controller: controller.name!,
                  icon: Icons.person,
                  hintText: 'الاسم',
                  labelText: 'الاسم',
                  validator: (val) {
                    return validInput(val!, 1, 20, 'none');
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormFieldWithSuffix(
                  enabled: controller.data["status"] == 1 ? false : true,
                  controller: controller.idNumber!,
                  icon: Icons.assignment_ind,
                  hintText: '120xxxxxxxxxxx',
                  readOnly: true,
                  labelText: 'الرقم الوطني',
                  validator: (val) {
                    return validInput(val!, 11, 11, 'none');
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormFieldWithMask(
                  onTap: () {
                    controller.showCalender(context);
                  },
                  enabled: controller.data["status"] == 1 ? false : true,
                  controller: controller.date!,
                  hintText: '2002-03-27',
                  labelText: 'تاريخ الميلاد',
                  validator: (val) {
                    return validInput(val!, 1, 20, 'none');
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomDropDownButton(
                  enabled: controller.data["status"] == 1 ? false : true,
                  isDense: true,
                  listData: const ['طالب', 'عسكري', 'مدني'],
                  hintText: 'طالب',
                  isSelected: controller.isSelected,
                  onChanged: (val) {
                    controller.selectData(val);
                  },
                  labelText: 'المهنة',
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormFieldWithoutWrite(
                    onTap: () {
                      controller.pickImage();
                    },
                    isDense: true,
                    labelText: 'الأوراق الثبوتية',
                    hintText: 'اضغط على اشارة + لاضافة الثبوتيات',
                    icon: Icons.add),
                SizedBox(
                  height: 4.h,
                ),
                controller.data["status"] == 0
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: CustomMatrerialButton(
                          text: 'تعديل الحساب',
                          onPressed: () {
                            controller.updateData();
                          },
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 1.h),
                        child: CustomMatrerialButton(
                          text: 'حذف حسابي',
                          onPressed: () {
                            popDeletAccount();
                          },
                        ),
                      ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ));
    });
  }
}
