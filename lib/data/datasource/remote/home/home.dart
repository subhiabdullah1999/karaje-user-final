import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/services/services.dart';
import '../../../../linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);
  MyServices myServices = Get.find();

  getslides() async {
    var response = await crud.getData(AppLink.getSlides, {});
    return response.fold((l) => l, (r) => r);
  }

  getcities() async {
    var response = await crud.getData(AppLink.getcity, {
      'Authorization':
          'Bearer ${myServices.sharedPreferences.getString("token")}'
    });
    return response.fold((l) => l, (r) => r);
  }

  gettrips(
    String start_id,
    String end_id,
    String start_date,
  ) async {
    var response = await crud.postData(AppLink.searchtrip, {
      "start_id": start_id,
      "end_id": end_id,
      "start_date": start_date,
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
