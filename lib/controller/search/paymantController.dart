import 'package:get/get.dart';
import 'package:karajaapp/linkapi.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/addReservationData.dart';
import '../../view/screen/serach/cardDetailsScreen.dart';

class PaymantController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddReservationData addReservationData = AddReservationData(Get.find());
  Map data={},mapData={};
  MyServices myServices = Get.find();

  @override
  void onInit() {
    mapData=Get.arguments;
    print("=============================== $mapData onsure");
    print( AppLink.token);
    print( mapData['id'].toString());
    print( mapData['selectedIndices']);
    print( mapData['travelName'].toString());
    print( mapData['date']);
      }

      onSure() async {
        print("=============================== mapData onsure");
        print( mapData['date']);
      statusRequest = StatusRequest.loading;
      update();
      var response = await addReservationData.addReservationData(
          myServices.sharedPreferences.getString("token")!,
          mapData['id'].toString(),
          mapData['selectedIndices'],
          mapData['travelName'].toString(),
          myServices.sharedPreferences.getString("idNumber")!,
          mapData['date']);


      print("=============================== response onsure $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map mapData = {};
        mapData.addAll(response);
        if (mapData["status"] == true) {
          data = mapData['data']['Reservation'];
          print("=============================== data ");
          print(data);
          await completedRes();
        } else {
          data = mapData['data']['Reservation'];
          print("=============================== data ");
          print(data);
          await completedRes();
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {}
    }

  completedRes() async {
    print('@@@@@@@@@@@@@@@@@@@@@@completedRes');
    print(data);
    print('@@@@@@@@@@@@@@@@@@@@@@completedRes');
    statusRequest = StatusRequest.loading;
    update();
    var response = await addReservationData.completedResData(
      data['id'].toString(),
    );
    print("=============================== response completedRes $response ");
    print("=============================== statusRequest $statusRequest ");
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        Get.to(() =>  CardDetailsScreen(), arguments: {
          'data': data,
        });
      } else {}
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }
}
