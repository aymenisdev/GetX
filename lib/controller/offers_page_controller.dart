import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/home_page.dart';
import '../view/offers.dart';

class OffersPageController extends GetxController {
  late TabController tabController;
  List<Widget> screens = [
    Offers(),
    Offers(),
    Offers(),
  ];
  @override
  void onInit() {

    super.onInit();
  }
}
