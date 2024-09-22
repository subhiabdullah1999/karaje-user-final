import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:karajaapp/core/class/statusrequest.dart';
import 'package:karajaapp/view/screen/home/mainscreen.dart';
import 'package:karajaapp/view/screen/serach/searchScreen.dart';
import 'package:screenshot/screenshot.dart';

import '../../core/class/crud.dart';
import '../../core/constant/color.dart';
import '../../view/widget/serach/cardForMyTickets.dart';

class CardDetailsController extends GetxController {
  Map data = {};
  var imageFile;
  ScreenshotController screenshotController = ScreenshotController();
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    data = Get.arguments['data'];
    print('==========================data==================$data');
    print(data);
    super.onInit();
  }

  onDownloadCard() {
    statusRequest = StatusRequest.loading;
    update();
    screenshotController
        .captureFromWidget(screenShotImage())
        .then((image) async {
      // await [Permission.storage].request();
      await ImageGallerySaver.saveImage(image);
      statusRequest = StatusRequest.success;
      update();
      Get.deleteAll();
      Get.offAll(() => MainScreen());
      Get.snackbar(
        "نجحت العملية",
        "تم حفظ صورة البطاقة بنجاح علماً أن البطاقة صالحة لمرة واحدة فقط",
        colorText: Colors.white,
        backgroundColor: AppColor.primaryColor,
        duration: const Duration(seconds: 6),
      );
    }).catchError((onError) {
      print(onError);
    });
  }

  onSaveAnotherCard() {
    Get.put(Crud());
    Get.deleteAll();
    Get.offAll(() =>  SearchScreen());
  }

  screenShotImage() {
    return Screenshot(
      controller: screenshotController,
      child: CardForMyTickets(
        startPlace: data['Trip']['Start_City']['name'],
        endPlace: data['Trip']['End_City']['name'],
        startTime: DateFormat('HH:mm').format(DateFormat('HH:mm').parse(data['Trip']['Start_Time'])).toString(),
        endTime: DateFormat('HH:mm').format(DateFormat('HH:mm').parse(data['Trip']['End_Time'])).toString(),
        period: DateFormat('HH:mm').format(DateTime(
            0,
            0,
            0,
            DateFormat('HH:mm').parse(data['Trip']['End_Time'])
                .difference(DateFormat('HH:mm').parse(data['Trip']['Start_Time']))
                .inHours,
            DateFormat('HH:mm').parse(data['Trip']['End_Time'])
                .difference(DateFormat('HH:mm').parse(data['Trip']['Start_Time']))
                .inMinutes
                .remainder(60))),
        isPendeing: false,
        companyName: data['company']['Companyname'],
        linkImage: 'logos/${data['company']['logo']}',
        numChair: data['NumChairs'],
        data: data['id'].toString(),
        priceTicket: data['totalPrice'].toString(),
        date: DateFormat('yyyy/MM/dd')
            .format(DateTime.parse(data['Trip']['Start_Date'])),
        name: data['name'],
      ),
    );
  }
}
