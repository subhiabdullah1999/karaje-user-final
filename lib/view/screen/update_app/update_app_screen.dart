import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/controller/update_app/update_app_controller.dart';
import 'package:karajaapp/view/widget/Auth/AuthButton.dart';
import 'package:karajaapp/view/widget/Auth/PrivacyCheckbox.dart';
import 'package:karajaapp/view/widget/serach/customMatrerialButton.dart';
import 'package:karajaapp/view/widget/update-app/custom_ison_update.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateApp extends StatelessWidget {
  const UpdateApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateAppControllerImp());
    return SafeArea(
        child: GetBuilder<UpdateAppControllerImp>(
            builder: (controller) => Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "هذا الاصدار من التطبيق اصبح قديم \n يرجى تثبيت النسخة الاحدث",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        PrivacyCheckbox(),
                        // const SizedBox(
                        //   height: 25,
                        // ),
                        UpdateButton(
                          buttonText: ' تحديث من المتجر',
                          onPressed: () async {
                            await launchUrl(
                                Uri.parse("${controller.data["app_url"]}"));
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        UpdateButton(
                          buttonText: 'تحميل من الموقع',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
