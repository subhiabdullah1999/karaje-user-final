import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karajaapp/data/datasource/remote/addReservationData.dart';
import 'package:karajaapp/view/screen/Payments/e_cash.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../view/screen/home/seatReserve.dart';

class TravelDetailsController extends GetxController {
  MyServices myServices = Get.find();
  GlobalKey<FormState>? formstate;
  StatusRequest statusRequest = StatusRequest.none;
  AddReservationData addReservationData = AddReservationData(Get.find());
  late TextEditingController travelName;
  late TextEditingController travelMobile;
  late TextEditingController travelIdNumber;
  List methodePaymintList = [
    'إي-كاش',
    'سيريتيل كاش',
  ];
  Map data = {};
  Map data2 = {};
  var date;
  List chairs = [];
  var isSelected;
  bool isNotValid = false;

  final firstNumbersSelected = <bool>[];
  final secondNumbersSelected = <bool>[];
  final thirdNumbersSelected = <bool>[];
  final forthNumbersSelected = <bool>[];
  final fiveNumbersSelected = <bool>[];

  final selectedIndices = <int>[].obs;

  void toggleFirstNumberSelection(int index) {
    firstNumbersSelected[index] = !firstNumbersSelected[index];
    update();
  }

  void toggleSecondNumberSelection(int index) {
    secondNumbersSelected[index] = !secondNumbersSelected[index];
    update();
  }

  void toggleThirdNumberSelection(int index) {
    thirdNumbersSelected[index] = !thirdNumbersSelected[index];
    update();
  }

  void toggleForthNumberSelection(int index) {
    forthNumbersSelected[index] = !forthNumbersSelected[index];
    update();
  }

  void toggleFivethNumberSelection(int index) {
    fiveNumbersSelected[index] = !fiveNumbersSelected[index];
    update();
  }

  void updateSelectedIndices(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      data = Get.arguments['data'];
      date = Get.arguments['date'];
      for (int i = 0; i < (data['NumberOfChairs'] + 3 - 1) ~/ 3; i++) {
        firstNumbersSelected.add(false);
        secondNumbersSelected.add(false);
        thirdNumbersSelected.add(false);
        forthNumbersSelected.add(false);
        fiveNumbersSelected.add(false);

        print("dhhhhhhhhhhhhhhhjssssssssssssssssssss");
        print(firstNumbersSelected);
        print("dhhhhhhhhhhhhhhhjssssssssssssssssssss");
      }

      if (data['NumChairs'] is Map) {
        chairs = [];
        data['NumChairs'].forEach((date, chairList) {
          // Process each date and corresponding chair list
          DateTime dateTime = DateFormat("yyyy-M-d").parse(date);
          date = DateFormat("yyyy-MM-dd").format(dateTime);
          if (chairList != null) {
            chairs.addAll(chairList);
          }
        });
      } else {
        chairs = [];
      }
    }

    travelName = TextEditingController(
        text: myServices.sharedPreferences.getString('name').toString());
    travelIdNumber = TextEditingController(
        text: myServices.sharedPreferences.getString('idNumber').toString());
    travelMobile = TextEditingController(
        text: myServices.sharedPreferences.getString('phone').toString());

    formstate = GlobalKey<FormState>();
    print(data);
    super.onInit();
  }

  changePaymentMethode(val, price) {
    isSelected = val;
    update();
    // val == 'E-cash'
    //     ? Get.to(() => Ecash(
    //           price: '${price}',
    //         ))
    //     : Get.to(() => Cach2());
  }

  addChair() {
    Get.to(() => const SeatReserve());
  }

  onNext() async {
    if (selectedIndices.isEmpty) {
      return Get.snackbar("فشل", ' يجب حجز مقعد واحد على الأقل',
          colorText: Colors.white,
          backgroundColor: Colors.red.withOpacity(0.7),
          duration: const Duration(seconds: 3));
    }
    if (formstate!.currentState!.validate()) {
      Map myData = {};
      myData["id"] = data['id'];
      myData["selectedIndices"] = selectedIndices;
      myData["travelName"] = travelName.text.toString();
      myData["date"] = date;

      Get.to(
          () => Ecash(
              price:
                  ((data['Price'] * 1.5) * selectedIndices.length).toString()),
          arguments: myData);
    }
  }

  onCancel() {
    Get.back();
  }
}
