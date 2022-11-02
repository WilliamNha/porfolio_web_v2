import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var isClickIgnored = false.obs;
  ingoredClicked() {
    isClickIgnored.value = true;
    Timer(const Duration(microseconds: 500), () {
      isClickIgnored.value = false;
    });
  }
}
