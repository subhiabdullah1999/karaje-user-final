import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/crud.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/home/home.dart';
import '../../data/datasource/remote/searchData.dart';

abstract class HomeController extends GetxController {
  getslides();

  search();

  getcities();
}

class HomeControllerImp extends HomeController {
  Crud crud = Get.put(Crud());
  HomeData homeData = HomeData(Get.find());
  SearchData searchData = SearchData(Get.find());

  StatusRequest statusRequest = StatusRequest.loading;
  RxInt bottomNavIndex = 0.obs;
  late String start_id = "15";
  late String end_id = "16";

  List cities = [];
  List searchedcities = [];
  List slides = [];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var selectedIndex1 = 0.obs;

  void selectIndex1(int index) {
    selectedIndex1.value = index;
    update();
  }

  var selectedIndex2 = 1.obs;

  void selectIndex2(int index) {
    selectedIndex2.value = index;
    update();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
    print('open Drawer............');
  }

  @override
  getslides() async {
    if (true) {
      var response = await homeData.getslides();
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");

      if (StatusRequest.success == handlingData(response)) {
        Map mapData = {};
        mapData.addAll(response);
        if (mapData["status"] == true) {
          slides = mapData['data']['Slides'];
          print('---------- $slides');
          return true;
        } else {}
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {}
    }
  }

  @override
  getcities() async {
    if (true) {
      var response = await homeData.getcities();
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      if (StatusRequest.success == handlingData(response)) {
        Map mapData = {};
        mapData.addAll(response);
        if (mapData["status"] == true) {
          cities = mapData['data']['Cities'];
          print(cities);
          return true;
        } else {}
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {}
    }
  }

  @override
  search() async {
    if (start_id == end_id) {
      return Get.snackbar(
          "فشل", "لا يمكن ان تكون نقطة الانطلاق نفسها نقطة الوجهة",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    } else if (start_id != null && end_id != null) {
      print("start+++++++++++++++++++++++++++++++++++++++");
      print(start_id);
      print(end_id);
      print("start+++++++++++++++++++++++++++++++++++++++");
      statusRequest = StatusRequest.loading;
      update();
      var response = await searchData.searchData(
          start_id.toString(),
          end_id.toString(),
          '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}');
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        searchedcities.clear();

        Map mapData = {};
        mapData.addAll(response);
        if (mapData["status"] == true) {
          searchedcities = mapData['data']['Trips'];
          print(searchedcities);
          return true;
        } else {}
        if (data["status"] == true) {
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

  @override
  void onInit() async {
    await getcities();
    await getslides();
    await search();
    super.onInit();
  }

  @override
  void dispose() {
    getslides();
    getcities();
    search();
    super.dispose();
  }
}
