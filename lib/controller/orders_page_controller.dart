import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/home_page.dart';
import '../view/offers.dart';
import '../view/orders.dart';

class OrdersPageController extends GetxController {
  late TabController tabController;
  List<Widget> screens = [
    Orders(),
    Orders(),
  ];
}
