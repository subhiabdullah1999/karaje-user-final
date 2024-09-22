import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karajaapp/core/constant/color.dart';
import 'package:karajaapp/view/screen/serach/resultSearchScreen.dart';
import '../../core/class/crud.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/changeFormatTime.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/searchData.dart';

class SerachController extends GetxController {
  TextEditingController? date;
  TextEditingController? time;
  TimeOfDay? selectedTime;

  DateTime date2 = DateTime.now();
  int time2 = DateTime.now().hour;

  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  SearchData searchData = SearchData(Get.find());
  var selectedStartCity, selectedEndCity;
  int? startCityId, endCityId;
  Map city = {};
  List listCity = [];
  @override
  void onInit() {
    Get.put(Crud());
    getCity();
    date = TextEditingController(text: changeFormatDate(date2).toString());
    time = TextEditingController(text: selectedTime.toString());
    formstate = GlobalKey();
    super.onInit();
  }

  updateUi() {
    update();
  }

  selectCity(val, type) {
    if (type == 1) {
      selectedStartCity = val;
      startCityId = city[selectedStartCity];
    } else {
      selectedEndCity = val;
      endCityId = city[selectedEndCity];
    }
    update();
  }

  Future<void> showSelectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.primaryColor, // Customize the primary color
            // accentColor: Colors.teal, // Customize the accent color
            colorScheme: ColorScheme.light(primary: AppColor.primaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null) {
      selectedTime = pickedTime;
      update();
    }
    update();
  }

  void showCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.primaryColor, // Customize the primary color
            // accentColor: Colors.teal, // Customize the accent color
            colorScheme: ColorScheme.light(primary: AppColor.primaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
      // barrierLabel: 'اختر الوقت',
      cancelText: 'إلغاء', // Customize the Cancel button text
      confirmText: 'تأكيد', // Customize the Confirm button text
    ).then((DateTime? value) {
      if (value != null) {
        print(value);
        date?.text =
            '${DateFormat('yyyy/MM/dd').format(DateTime.parse(value.toString()))}';
        // Add your logic here to handle the selected date
      }
    });
  }

  switchBetweenControllers() {
    var temp = selectedEndCity;
    var tempId = endCityId;
    selectedEndCity = selectedStartCity;
    selectedStartCity = temp;
    endCityId = startCityId;
    startCityId = tempId;
    update();
  }

  getCity() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await searchData.getcities();
      print("=============================== response $response ");
      print("=====c========================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        print(data);
        if (data["status"] == true) {
          for (int i = 0; i < data['data']['Cities'].length; i++) {
            listCity.add(data['data']['Cities'][i]['name']);
            city.addAll({
              data['data']['Cities'][i]['name']: data['data']['Cities'][i]['id']
            });
          }
          print(city);
          print(listCity);
        } else {
          return Get.snackbar("فشل", 'لا يوجد رحلات متوفرة في هذا اليوم',
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "تحقق من الاتصال بالانترنت");
      }
    }
  }

  seaech() async {
    var date1 = DateFormat('yyyy/MM/dd').parse(date!.text);
    if (startCityId == endCityId) {
      return Get.snackbar(
          "فشل", "لا يمكن ان تكون نقطة الانطلاق نفسها نقطة الوجهة",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    } else if (DateFormat('yyyy/MM/dd').parse(date!.text).isBefore(date2) &&
        !(date1.year == date2.year &&
            date1.month == date2.month &&
            date1.day == date2.day)) {
      return Get.snackbar("فشل", "لا يمكن ان يكون التاريخ في الماضي ",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    } else if (startCityId != null && endCityId != null && date != null) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await searchData.searchData(
          startCityId.toString(),
          endCityId.toString(),
          '${date!.text.split('/')[0]}-${date!.text.split('/')[1]}-${date!.text.split('/')[2]}');
      print("==n============================= response $response ");
      print("==n============================= statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        print(data['status']);
        if (data["status"] == true) {
          Get.to(const ResultSearchScreen(), arguments: {
            'data': data['data']['Trips'],
            'date':
                '${date!.text.split('/')[0]}-${date!.text.split('/')[1]}-${date!.text.split('/')[2]}'
          });
        } else {
          return Get.snackbar("فشل", 'لا يوجد رحلات متوفرة في هذا اليوم',
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "تحقق من الاتصال بالانترنت");
      }
    } else {
      return Get.snackbar("فشل", 'يجب ملئ جميع الحقول',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }
}
