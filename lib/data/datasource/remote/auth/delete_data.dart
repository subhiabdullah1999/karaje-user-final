import 'package:get/get.dart';
import 'package:karajaapp/core/services/services.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class DeletData {
  MyServices myServices = Get.find();
  Crud crud;

  DeletData(this.crud);

  deletedata() async {
    var userId = myServices.sharedPreferences.get("userId").toString();
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhddddddddddddddddddddffffffffff");
    print(myServices.sharedPreferences.getString("userId"));

    var response = await crud
        .deleteData("https://ac.ka-ad.sy/api/client/delete/$userId", {}, {});
    return response.fold((l) => l, (r) => r);
  }
}
