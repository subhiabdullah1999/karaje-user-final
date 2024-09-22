import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajaapp/bindings/intialbindings.dart';
import 'package:karajaapp/controller/update_app/update_app_controller.dart';
import 'package:karajaapp/core/class/crud.dart';
import 'package:karajaapp/routes.dart';
import 'package:karajaapp/view/screen/Auth/signIn.dart';
import 'package:karajaapp/view/screen/Auth/signUp.dart';
import 'package:karajaapp/view/screen/splash/splash.dart';
import 'package:karajaapp/view/widget/home/noInternet.dart';
import 'controller/homePage/mainController.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<Crud>(() async => Crud(), permanent: true);
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return Sizer(builder: (context, orientation, deviceType) {
      return NoInternetWidget(
        widget: GetMaterialApp(
          useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          // localizationsDelegates:  [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          // ],
          // supportedLocales: const [
          //   Locale('ar','AR'),
          //   Locale('en',''),
          // ],

          translations: MyTranslation(),
          debugShowCheckedModeBanner: false,
          theme: controller.appTheme,
          home: Splash(),
          locale: const Locale('ar', 'AR'),
          initialBinding: InitialBindings(),
          getPages: routes,
        ),
      );
    });
  }
}
