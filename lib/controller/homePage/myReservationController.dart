import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:karajaapp/linkapi.dart';
import 'package:screenshot/screenshot.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/myReservationData.dart';
import '../../view/widget/serach/cardForMyTickets.dart';

class MyReservationController extends GetxController {
  List data = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  MyReservationData myReservationData = MyReservationData(Get.find());
  var imageFile;
  ScreenshotController screenshotController = ScreenshotController();
  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }

  getData() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await myReservationData.myReservationData(AppLink.token);
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map mapData = {};
        mapData.addAll(response);
        if (mapData["status"] == true) {
          data = mapData['data']['Reservation'];
          data = data.reversed.toList();
          print(data);
        } else {}
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {}
    }
  }



   onDownloadCard(data) {
    statusRequest = StatusRequest.loading;
    update();
    screenshotController
        .captureFromWidget(screenShotImage(data))
        .then((image) async {
      // await [Permission.storage].request();
      await ImageGallerySaver.saveImage(image);
      statusRequest = StatusRequest.success;
      update();
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

  
  screenShotImage(data) {
    // print(data['Trip']['Start_City']['name']);
    // print(data['Trip']['End_City']['name']);
    //  print(DateFormat('HH:mm').format(DateFormat('HH:mm').parse(data['Start_Time'])).toString());
    // // print(DateFormat('HH:mm').format(DateFormat('HH:mm').parse(data['End_Time'])).toString());
    // // print(DateFormat('HH:mm').format(DateTime(
    // //             0,
    // //             0,
    // //             0,
    // //             DateFormat('HH:mm').parse(data['End_Time'])
    // //                 .difference(DateFormat('HH:mm').parse(data['Start_Time']))
    // //                 .inHours,
    // //             DateFormat('HH:mm').parse(data['End_Time'])
    // //                 .difference(DateFormat('HH:mm').parse(data['Start_Time']))
    // //                 .inMinutes
    // //                .remainder(60))));
    // print(data['company']['Companyname']);
    // print('logos/${data['company']['logo']}');

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
