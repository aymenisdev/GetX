import 'package:get/get.dart';

import '../view/home.dart';
import '../view/home_page.dart';
import '../view/offers_page.dart';
import '../view/on_boarding.dart';
import '../view/service_list.dart';
import '../view/sign_in.dart';
import '../view/sign_up.dart';
import '../view/splash.dart';
import 'app_routes.dart';

final appPages = [
  GetPage(name: AppRoutes.splash, page: () => Splash()),
  GetPage(name: AppRoutes.onBoarding, page: () => OnBoarding()),
  GetPage(name: AppRoutes.signIn, page: () => SignIn()),
  GetPage(name: AppRoutes.signUp, page: () => SignUp()),
  GetPage(name: AppRoutes.serviceList, page: () => ServiceList()),
  GetPage(name: AppRoutes.home, page: () => Home()),
  GetPage(name: AppRoutes.homePage, page: () => HomePage()),
  GetPage(name: AppRoutes.offersPage, page: () => OffersPage()),
];
