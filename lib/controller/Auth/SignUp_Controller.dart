import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:karajaapp/core/constant/imgaeasset.dart';
import 'package:karajaapp/view/screen/Auth/signIn.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/auth/signUp.dart';
import '../../core/functions/changeFormatTime.dart';
import '../../core/functions/requestPermission.dart';

abstract class SignUpController extends GetxController {
  signUp(BuildContext context);

  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  DateTime date2 = DateTime.now();
  TextEditingController? date;
  SignUpData signUpData = SignUpData(Get.find());
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController idNumber;
  DateTime selectedBirthDate = DateTime.now();
  MyServices myServices = Get.find();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  bool isValid = true;
  StatusRequest statusRequest = StatusRequest.none;
  File? Imagefile;
  File? Imagefileuniv;
  var isChecked = false.obs;
  var selectedItem = 'مدني'.obs;
  var isClick = false.obs;

  showCalender(context) {
    showDatePicker(
            context: context,
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor:
                      AppColor.primaryColor, // Customize the primary color
                  // accentColor: Colors.teal, // Customize the accent color
                  colorScheme:
                      ColorScheme.light(primary: AppColor.primaryColor),
                  buttonTheme:
                      ButtonThemeData(textTheme: ButtonTextTheme.primary),
                ),
                child: child!,
              );
            },
            initialDate: date2,
            firstDate: DateTime(1900),
            // locale: const Locale('ar', 'AR'),
            lastDate: DateTime.now().add(const Duration(days: 30)))
        .then((DateTime? value) {
      if (value != null) {
        date = TextEditingController(text: changeFormatDate(value).toString());

        updateSelectedBirthDate(value);

        update();
      }
      // ignore: avoid_print
      print(value);
    });
  }

  void updateisClick(bool value) {
    isClick.value = value;
    update();
  }

  void updateSelectedBirthDate(DateTime time) {
    selectedBirthDate = time;
    update();
  }

  void updateSelectedItem(String item) {
    selectedItem.value = item;
    update();
  }

  void toggleChecked() {
    isChecked.toggle();
    update();
  }

  void pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      Imagefile = File(image.path);
      print(Imagefile);
      update();
    } else {
      Get.defaultDialog(middleText: 'يجب اختيار صورة ');
    }
  }

  void pickImageuniv(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      Imagefileuniv = File(image.path);
      print(Imagefileuniv);
      update();
    } else {
      Get.defaultDialog(middleText: 'يجب اختيار صورة ');
    }
  }

  @override
  signUp(BuildContext context) async {
    if (!isPermission) {
      requestPermission();
    }
    if (isPermission && form.currentState!.validate()) {
      if (selectedItem != 'طالب' && Imagefile == null) {
        Get.snackbar(
          'تحذير',
          'يرجى تحميل الصور المطلوبة',

          icon: const Icon(Icons.check_circle, color: Colors.green),
          duration: const Duration(seconds: 3),
          // backgroundColor: AppColor.orange, // Customize background color
          borderRadius: 10,
          margin: const EdgeInsets.all(10),
          animationDuration: const Duration(milliseconds: 2000),
          shouldIconPulse: true,
          snackPosition: SnackPosition.TOP,
          barBlur: 20,
          isDismissible: true,
        );
      } else if (selectedItem == 'طالب' && Imagefile == null ||
          Imagefileuniv == null) {
        Get.snackbar(
          'تحذير',
          'يرجى تحميل الصور المطلوبة',

          icon: const Icon(Icons.check_circle, color: Colors.green),
          duration: const Duration(seconds: 3),
          // backgroundColor: AppColor.orange, // Customize background color
          borderRadius: 10,
          margin: const EdgeInsets.all(10),
          animationDuration: const Duration(milliseconds: 2000),
          shouldIconPulse: true,
          snackPosition: SnackPosition.TOP,
          barBlur: 20,
          isDismissible: true,
        );
      } else {
        //statusRequest = StatusRequest.loading;
        updateisClick(true);
        update();
        var response = await signUpData.postdata(
          name.text,
          phone.text,
          idNumber.text,
          selectedItem == 'مدني'
              ? '0'
              : selectedItem == 'طالب'
                  ? '1'
                  : '2',
          DateFormat('yyyy-MM-dd').format(selectedBirthDate),
          Imagefile!,
          selectedItem == 'طالب'.obs ? Imagefileuniv! : Imagefile!,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == true) {
            Get.offAll(() => const SignIn());
          }
        } else if (statusRequest != StatusRequest.success) {
          statusRequest = handlingData(response);
          if (StatusRequest.failure == statusRequest) {
            if (response['status'] == false) {
              statusRequest = StatusRequest.none;
              update();
            }
          }

          // ignore: use_build_context_synchronously
        }
        updateisClick(false);
        update();
        // ignore: use_build_context_synchronously
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
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    response['message']['mobile'] != null
                        ? Icon(
                            EneftyIcons.mobile_outline,
                            color: AppColor.orange,
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      '${response['message']['mobile'] != null ? 'بالفعل يوجد حساب مرتبط برقمك المحمول' : ''} ',
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Cairo",
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    response['message']['idNumber'] != null
                        ? Icon(
                            EneftyIcons.profile_circle_bold,
                            color: AppColor.orange,
                          )
                        : SizedBox(),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      '${response['message']['idNumber'] != null ? 'بالفعل يوجد حساب مرتبط برقمك الوطني ' : ''}',
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Cairo",
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ).show();
      }
    } else {
      isValid = false;
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.signIn);
  }

  @override
  void onInit() {
    requestPermission();
    name = TextEditingController();
    phone = TextEditingController();
    idNumber = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    idNumber.dispose();
    super.dispose();
  }
}
