import 'package:dio/dio.dart' as d;
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../model/user/user_model.dart';
import '../routes/app_routes.dart';
import '../services/api_constant.dart';
import '../services/http_service.dart';
import '../services/storage_service.dart';
import '../translations/lang_keys.dart';

class SignInController extends GetxController {
  HttpService httpService = HttpService();
  final storage = Get.find<StorageService>();
  var isMobileSelected = true.obs;
  final userName = TextEditingController();
  final password = TextEditingController();

  @override
  void onInit() {
    httpService.init();
    super.onInit();
  }

  Future<void> login() async {
    try {
      Map<String, String> body = {
        'userName': userName.text,
        'password': password.text,
      };
      EasyLoading.show();
      final result = await httpService.request(
          url: ApiConstant.login, method: Method.POST, params: body);
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
