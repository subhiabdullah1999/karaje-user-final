import 'package:get/get.dart';


class ResultSerachController extends GetxController {
  List data = [];
  String? date;
  @override
  Future<void> onInit() async {
    data = Get.arguments['data'];
    date=Get.arguments['date'];
    print(date);
    data = data.reversed.toList();
    super.onInit();
  }
}
