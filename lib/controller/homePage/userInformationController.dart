import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/changeFormatTime.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/myProfileData.dart';
import '../../linkapi.dart';

class UserInformationController extends GetxController {
  TextEditingController? name = TextEditingController();
  TextEditingController? idNumber = TextEditingController();
  TextEditingController? date = TextEditingController();
  DateTime date2 = DateTime.now();
  var isSelected;
  int? idType;
  File? file;
  Map data = {};
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  MyProfileData myProfileData = MyProfileData(Get.find());
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      print(file);
      update();
    } else {
      Get.defaultDialog(middleText: 'You must switch image');
    }
  }

  showCalender(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    ).then((DateTime? value) {
      if (value != null) {
        date = TextEditingController(text: changeFormatDate(value).toString());
        update();
      }
      // ignore: avoid_print
      print(value);
    });
  }

  selectData(val) {
    isSelected = val;

    if (val == 'طالب') {
      idType = 1;
    } else if (val == 'عسكري') {
      idType = 2;
    } else {
      idType = 3;
    }
    update();
  }

  getData() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await myProfileData.myProfileData(AppLink.token);
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map mapData = {};
        mapData.addAll(response);
        if (mapData["status"] == true) {
          data = mapData['data']['Client'];
          name = TextEditingController(text: data['name'].toString());
          idNumber = TextEditingController(text: data['idNumber'].toString());
          date = TextEditingController(
              text: data['date_birth'] != null
                  ? data['date_birth'].toString()
                  : changeFormatDate(date2).toString());
          idType = data['id'];
          if (data['id'] == 1) {
            isSelected = 'طالب';
          } else if (data['id'] == 2) {
            isSelected = 'عسكري';
          } else {
            isSelected = 'مدني';
          }
          print("++++++++++++++++++++++++++++++++++++");
          print(data);
          print("++++++++++++++++++++++++++++++++++++");
        } else {}
      } else if (statusRequest == StatusRequest.offlinefailure) {
      } else if (statusRequest == StatusRequest.serverfailure) {}
    }
  }

  // popDeletAccount() {
  //   Get.defaultDialog(
  //     titlePadding: const EdgeInsets.all(10),
  //     contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
  //     title: "تحذير",
  //     backgroundColor: Colors.white,
  //     content: Text("هل انت متأكد من حذف حسابك ؟"),
  //     confirm: Padding(
  //       padding: const EdgeInsets.only(left: 20, right: 20),
  //       child: ElevatedButton(
  //           onPressed: () {
  //             // Get.back(canPop: false);
  //           },
  //           child: Text("حذف")),
  //     ),
  //     cancel: Padding(
  //       padding: const EdgeInsets.only(left: 20, right: 20),
  //       child: ElevatedButton(
  //           onPressed: () {
  //             Get.back();
  //           },
  //           child: Text("تراجع")),
  //     ),
  //   );
  // }

  updateData() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await myProfileData.updateProfileData(AppLink.token,
          date!.text, idType.toString(), name!.text, idNumber!.text, file);
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map mapData = {};
        mapData.addAll(response);
        if (mapData["status"] == true) {
          print(mapData);
          return Get.snackbar(
            "نجحت العملية",
            "تم تعديل البيانات بنجاح",
            colorText: Colors.white,
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 6),
          );
        } else {}
      } else if (statusRequest == StatusRequest.offlinefailure) {
      } else if (statusRequest == StatusRequest.serverfailure) {}
    }
    statusRequest = StatusRequest.success;
  }
}
