import 'package:get/get.dart';

class DetailsCompanyController extends GetxController {
  Map data = {};
  @override
  void onInit() {
    data = Get.arguments;
    print(data);
    // TODO: implement onInit
    super.onInit();
  }
}
