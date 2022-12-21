import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../services/storage_service.dart';

class SplashController extends GetxController{
  final storage = Get.find<StorageService>();

  @override
  void onInit() {
    // TODO: implement onInit
    checkAuth();
    super.onInit();
  }



  void checkAuth() async {
    Future.delayed(const Duration(seconds: 3), () {
      if (storage.isIntro()) {
        if(storage.getUser() != null){
        Get.offAllNamed(AppRoutes.home);
        }else{
          Get.offAllNamed(AppRoutes.onBoarding);
        }
      }else{
        Get.offAllNamed(AppRoutes.onBoarding);
      }
    });
  }
}