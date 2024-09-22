import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/controller/homePage/notification_id_controller.dart';
import 'package:karajaapp/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class NotificationId extends StatelessWidget {
  const NotificationId({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationIdControllerImp());
    return SafeArea(
        child: GetBuilder<NotificationIdControllerImp>(
            builder: (controller) => Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    leading: const SizedBox(),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    actions: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColor.black,
                            size: 15.sp,
                          )),
                    ],
                    title: Text(
                      controller.listNoti[controller.id]["type"],
                      style: TextStyle(color: Colors.black87, fontSize: 15.sp),
                    ),
                    centerTitle: true,
                  ),
                  body: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.green)),
                        child: Text(
                          controller.listNoti[controller.id]["description"],
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                )));
  }
}
