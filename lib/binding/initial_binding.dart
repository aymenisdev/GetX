
import 'package:get/get.dart';
import 'package:ptoolz/controller/service_list_controller.dart';
import 'package:ptoolz/controller/splash_controller.dart';

import '../controller/sign_up_controller.dart';


class InitialBinding implements Bindings{
  @override
  void dependencies() {
    // Get.put(ServiceListController());
    Get.put(SignUpController());

  }


}