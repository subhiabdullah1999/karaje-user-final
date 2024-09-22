import 'package:get/get.dart';

abstract class NotificationIdController extends GetxController {}

class NotificationIdControllerImp extends NotificationIdController {
  late List listNoti;
  late int id;
  @override
  void onInit() {
    listNoti = Get.arguments["listNotif"];
    id = Get.arguments["id"];

    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddddddddddddddddd");
    print(listNoti);
    print(id);
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddddddddddddddddd");

    super.onInit();
  }
}
