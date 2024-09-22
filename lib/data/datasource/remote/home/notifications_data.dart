import 'package:get/get.dart';
import 'package:karajaapp/core/class/crud.dart';
import 'package:karajaapp/core/services/services.dart';
import 'package:karajaapp/linkapi.dart';

class NotificationsData {
  Crud crud;
  MyServices myServices = Get.find();
  NotificationsData(this.crud);
  notificationsData() async {
    String? token = myServices.sharedPreferences.getString("token");
    var response = await crud.getData(AppLink.notificationsLink, {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
