import 'package:get/get.dart';
import 'package:karajaapp/core/constant/routes.dart';
import 'package:karajaapp/view/screen/Auth/checkCode.dart';
import 'package:karajaapp/view/screen/Auth/signIn.dart';
import 'package:karajaapp/view/screen/Auth/signUp.dart';
import 'package:karajaapp/view/screen/Payments/cach1.dart';
import 'package:karajaapp/view/screen/Payments/cach2.dart';
import 'package:karajaapp/view/screen/home/AboutApp.dart';
import 'package:karajaapp/view/screen/home/CallUs.dart';
import 'package:karajaapp/view/screen/home/home.dart';
import 'package:karajaapp/view/screen/home/notification_id.dart';
import 'package:karajaapp/view/screen/home/seatReserve.dart';
import 'package:karajaapp/view/screen/home/terms_and_conditions.dart';
import 'package:karajaapp/view/screen/serach/searchScreen.dart';
import 'package:karajaapp/view/screen/splash/splash.dart';
import 'package:karajaapp/view/screen/testScreen.dart';
import 'package:karajaapp/view/screen/update_app/update_app_screen.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: '/', page: () => const UpdateApp()),
  GetPage(name: '/', page: () => const TestScreen()),
  GetPage(name: AppRoute.searchScreen, page: () => const SearchScreen()),
  // splash
  GetPage(name: AppRoute.splash, page: () => Splash()),

  // Auth
  GetPage(name: AppRoute.signIn, page: () => SignIn()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.verfiyCode, page: () => CheckCode()),

  // Home
  GetPage(name: AppRoute.home, page: () => const Home()),
  GetPage(name: AppRoute.seatReserve, page: () => const SeatReserve()),
  GetPage(name: AppRoute.cach1, page: () => const Cach1()),
  GetPage(name: AppRoute.cach2, page: () => Cach2()),
  GetPage(name: AppRoute.aboutApp, page: () => const AboutApp()),
  GetPage(name: AppRoute.termsandconditions, page: () => TermsAndConditions()),
  GetPage(name: AppRoute.notificationId, page: () => NotificationId()),
];
