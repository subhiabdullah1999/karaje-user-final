import 'package:get/get.dart';
import 'package:karajaapp/core/class/statusrequest.dart';
import 'package:karajaapp/core/functions/handingdatacontroller.dart';
import 'package:karajaapp/core/services/services.dart';
import 'package:karajaapp/data/datasource/remote/update_App_data.dart';

abstract class UpdateAppController extends GetxController {
  updateUi() {}
}

class UpdateAppControllerImp extends UpdateAppController {
  @override
  var isChecked = false.obs;
  var isClick = false.obs;

  void updateisClick(bool value) {
    isClick.value = value;
    update();
  }

  void toggleChecked() {
    isChecked.toggle();
    update();
  }

  Map data = {};
  List notifData = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  UpdateAppData updateAppData = UpdateAppData(Get.find());

  getVersionAppData() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await updateAppData.updateAppData();
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map mapData = {};
        mapData.addAll(response);
        if (mapData["status"] == true) {
          // data = mapData['data'];
          data = response["data"];
          myServices.sharedPreferences.setString("app_v", "${data["app_v"]}");
          // for (var item in response) {
          //   notifData.add(NotificationsModel.fromJson(item));

          //   update();
          // }
          print(
              "_______________________________________________________________________");
          print(data);
          print(data["app_v"]);
          print(
              "____+++++++++++++++_________________________+++++++++++++++++++++++++_______________________");
        } else {}
      } else if (statusRequest == StatusRequest.offlinefailure) {
      } else if (statusRequest == StatusRequest.serverfailure) {}
    }
  }

  @override
  void onInit() {
    getVersionAppData();
    super.onInit();
  }
}
