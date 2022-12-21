import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/home_page.dart';
import '../view/notifications_page.dart';
import '../view/offers_page.dart';
import '../view/orders_page.dart';

class HomeController extends GetxController{

  var currentIndex = 0.obs;
  List<Widget> screens = [
    HomePage(),
    OffersPage(),
    OrdersPage(),
    NotificationsPage(),
  ];
}