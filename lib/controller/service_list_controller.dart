import 'package:dio/dio.dart' as d;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ptoolz/controller/sign_up_controller.dart';
import 'package:ptoolz/model/category/category.dart';

import '../model/category/category_model.dart';
import '../model/service.dart';
import '../services/api_constant.dart';
import '../services/http_service.dart';

class ServiceListController extends GetxController {
  HttpService httpService = HttpService();
  // final signUpController = Get.find<SignUpController>();

  var dataList = <Service>[].obs;
  var indexSelected = -1.obs;
  var isLoading = false.obs;
  var categoryList = <Category>[].obs;


  @override
  void onInit() {
    // serviceList();

    httpService.init();

    super.onInit();
  }


  void serviceList() {
    dataList
        .add(Service(icon: "assets/icon/print_se.svg", name: "طباعه", key: ""));
    dataList.add(
        Service(icon: "assets/icon/produced_se.svg", name: "مونتاج", key: ""));
    dataList
        .add(Service(icon: "assets/icon/photo_se.svg", name: "تصوير", key: ""));
    dataList.add(Service(
        icon: "assets/icon/camera_rental_se.svg",
        name: "تاجير كاميرات",
        key: ""));
    dataList.add(Service(
        icon: "assets/icon/translation_se.svg", name: "الترجمة", key: ""));
    dataList
        .add(Service(icon: "assets/icon/gifts_se.svg", name: "هدايا", key: ""));
    dataList.add(Service(
        icon: "assets/icon/study_services_se.svg",
        name: "الخدمات الدراسية",
        key: ""));
  }
}
