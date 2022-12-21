import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:ptoolz/model/category/category.dart';

import '../model/category/category_model.dart';
import '../model/user/user_model.dart';
import '../routes/app_routes.dart';
import '../services/api_constant.dart';
import '../services/http_service.dart';
import '../services/storage_service.dart';
import '../translations/lang_keys.dart';

class SignUpController extends GetxController {
  HttpService httpService = HttpService();
  final storage = Get.find<StorageService>();

  var indexSelected = -1.obs;
  var isLoading = false.obs;
  var categoryList = <Category>[].obs;

  var isClientSelected = true.obs;
  var isTermsChecked = false.obs;
  var phoneCode = "966".obs;
  var countryCode = 'SA'.obs;

  final email = TextEditingController();
  final fullName = TextEditingController();
  final userName = TextEditingController();
  final mobile = TextEditingController();
  final password = TextEditingController();

  @override
  void onInit() {
    httpService.init();
    super.onInit();
  }

  Future<bool?> isMobileValid() async {
    // if (kDebugMode) {
    //   print(mobile.text);
    //   print(countryCode);
    // }
    bool? isValid = await PhoneNumberUtil.isValidPhoneNumber(
        phoneNumber: mobile.text, isoCode: countryCode.value);
    return isValid;
  }

  Future<void> getCategory() async {
    try {
      // EasyLoading.show();
      isLoading(true);
      final result = await httpService.request(
          url: ApiConstant.category, method: Method.GET);
      if (result != null) {
        if (result is d.Response) {
          var resp = CategoryModel.fromJson(result.data);
          categoryList.clear();
          if (resp.data != null && resp.data!.isNotEmpty) {
            categoryList.addAll(resp.data!);
          }
        }
      }
    } finally {
      isLoading(false);
      // EasyLoading.dismiss(animation: true);
    }
  }
  Future<void> signup() async {
    try {
      Map<String, String> body = {
        'email': email.text,
        'fullName': fullName.text,
        'userName': userName.text,
        'mobile': mobile.text.startsWith('0') ? mobile.text : "0${mobile.text}",
        'password': password.text,
        'accountTypeId': isClientSelected.isTrue ? "1" : "2",
      };
      if (isClientSelected.isFalse) {
        body['delivery'] = "0";
        body['categoryId'] = "${categoryList[indexSelected].id}";
      }

      EasyLoading.show();
      final result = await httpService.request(
          url: ApiConstant.signup, method: Method.POST, params: body);
      if (result != null) {
        if (result is d.Response) {
          var data = UserModel.fromJson(result.data);
          if (data.status == "1") {
            storage.setUser(data.data!.user!);
            storage.setUserToken(data.data!.token!);
            Get.offAllNamed(AppRoutes.home);
            Get.snackbar(LangKeys.success.tr, data.msg!);
          } else {
            Get.snackbar(LangKeys.error.tr, data.msg!);
            // showErrorBottomSheet(data.message!);
          }
        }
      }
    } finally {
      EasyLoading.dismiss(animation: true);
    }
  }
}
