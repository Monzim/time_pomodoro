import 'dart:async';

import 'package:get/get.dart';

class CountController extends GetxController {
  @override
  void onInit() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      update();
    });
    super.onInit();
  }
}
