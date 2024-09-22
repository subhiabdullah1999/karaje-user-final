import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/services/services.dart';
import '../../../../linkapi.dart';

class CheckCodeData {
  Crud crud;

  CheckCodeData(this.crud);
  MyServices myServices = Get.find();

  postdata(
    String code,
  ) async {
    var response = await crud.postData(AppLink.checkCode, {
      "code": code,
    }, {
      'Authorization':
          'Bearer ${myServices.sharedPreferences.getString("token")}'
    });
    return response.fold((l) => l, (r) => r);
  }
}
