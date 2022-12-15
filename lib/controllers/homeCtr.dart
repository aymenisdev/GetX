// ignore: file_names
// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageCtr extends GetxController {
  Rx<Icon> myIcon = const Icon(Icons.save).obs;
  // RxBool active = false.obs;
  helloWorld() {
    print('hello World');
    update();
  }

  changeIcon() {
    myIcon.value = const Icon(Icons.edit);
    update();
  }

  changeIconX() {
    myIcon.value = const Icon(Icons.edit);
    // update();
  }
}
