import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:karajaapp/core/class/statusrequest.dart';
import 'package:karajaapp/core/functions/handingdatacontroller.dart';
import 'package:karajaapp/core/services/services.dart';
import 'package:karajaapp/data/datasource/remote/update_App_data.dart';

class MainController extends GetxController {
  DateTime? currentBackPressTime;

  @override
  void onInit() {
    // TODO: implement onInit
    SystemChannels.lifecycle.setMessageHandler((msg) {
      if (msg == AppLifecycleState.resumed.toString()) {
        currentBackPressTime = null;
      }
      return Future.value('');
    });

    super.onInit();
  }

  // Future<bool> onWillPop(context) async {
  //   DateTime now = DateTime.now();
  //   if (currentBackPressTime == null ||
  //       now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
  //     currentBackPressTime = now;
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Press back again to exit')),
  //     );
  //     return false;
  //   }
  //   return true;
  // }
}
