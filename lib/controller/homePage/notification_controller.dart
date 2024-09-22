import 'package:get/get.dart';
import 'package:karajaapp/core/class/statusrequest.dart';
import 'package:karajaapp/core/functions/handingdatacontroller.dart';
import 'package:karajaapp/core/services/services.dart';
import 'package:karajaapp/data/datasource/remote/home/notifications_data.dart';
import 'package:karajaapp/data/model/notifications_model.dart';
import 'package:karajaapp/linkapi.dart';

abstract class NotificationsController extends GetxController {}

class NotificationsControllerImp extends NotificationsController {
  Map data = {};
  List notifData = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  NotificationsData notificationsData = NotificationsData(Get.find());

  getData() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await notificationsData.notificationsData();
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map mapData = {};
        mapData.addAll(response);
        if (mapData["status"] == true) {
          // data = mapData['data'];
          notifData = response["data"]['Notification'];
          // for (var item in response) {
          //   notifData.add(NotificationsModel.fromJson(item));

          //   update();
          // }

          print(notifData);
        } else {}
      } else if (statusRequest == StatusRequest.offlinefailure) {
      } else if (statusRequest == StatusRequest.serverfailure) {}
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    getData();
    super.dispose();
  }
}
