import 'package:get/get.dart';

class DropDownController extends GetxController {
  final RxString selectedValue = "".obs;

  updateUi() {
    update();
  }
}
