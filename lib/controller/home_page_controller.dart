import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/service.dart';
import '../view/home_page.dart';

class HomePageController extends GetxController{
  var dataList = <Service>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    serviceList();
    super.onInit();
  }




  void serviceList() {
    dataList
        .add(Service(icon: "assets/images/intro_printing.svg", name: "طباعه", key: ""));
    dataList.add(
        Service(icon: "assets/images/intro_produced.svg", name: "مونتاج", key: ""));
    dataList
        .add(Service(icon: "assets/images/intro_photo.svg", name: "تصوير", key: ""));
    dataList.add(Service(
        icon: "assets/images/intro_camera_rental.svg",
        name: "تاجير كاميرات",
        key: ""));
    dataList.add(Service(
        icon: "assets/images/intro_translation.svg", name: "الترجمة", key: ""));
    dataList.add(Service(icon: "assets/images/intro_gifts.svg", name: "هدايا", key: ""));
    dataList.add(Service(
        icon: "assets/images/intro_study_services.svg",
        name: "الخدمات الدراسية",
        key: ""));
    dataList.add(Service(
        icon: "assets/images/intro_companies.svg",
        name: "الشركات و المؤسسات",
        key: ""));
  }

}