import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/core/class/statusrequest.dart';
import 'package:karajaapp/core/constant/color.dart';
import 'package:karajaapp/core/constant/routes.dart';
import 'package:karajaapp/core/functions/handingdatacontroller.dart';
import 'package:karajaapp/core/services/services.dart';
import 'package:karajaapp/data/datasource/remote/auth/delete_data.dart';
import 'package:karajaapp/view/widget/loading.dart';

abstract class AboutAppController extends GetxController {
  deletAccount() {}
}

class AboutAppControllerImp extends AboutAppController {
  DeletData deleteData = DeletData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  @override
  deletAccount() async {
    statusRequest = StatusRequest.loading;

    var response = await deleteData.deletedata();
    statusRequest = handlingData(response);
    update();
    // Get.defaultDialog(
    //   titlePadding: const EdgeInsets.all(10),
    //   contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    //   title: "Loading".tr,
    //   backgroundColor: AppColor.primaryColor,
    //   content: Loading(),
    // );

    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        statusRequest = StatusRequest.success;
        update();

        Get.offAllNamed(AppRoute.signIn);
        myServices.sharedPreferences.clear();

        Get.snackbar(
          'نجاح',
          'تم حذف حسابك بنجاح',
          icon: const Icon(Icons.check_circle, color: Colors.green),
          duration: const Duration(seconds: 7),
          // backgroundColor: AppColor.orange, // Customize background color
          borderRadius: 10,
          margin: const EdgeInsets.all(10),
          animationDuration: const Duration(milliseconds: 500),
          shouldIconPulse: true,
          snackPosition: SnackPosition.TOP,
          barBlur: 20,
          isDismissible: true,
        );
        update();
      } else {
        print("falseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      }
    } else {
      print("tyeewsdgggddddddddddddddddddddddddddddddddddddddddd");
      // ignore: use_build_context_synchronously
    }

    update();
  }
}
