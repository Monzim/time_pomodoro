import 'dart:async';

import 'package:get/get.dart';

class CountController extends GetxController {
  final DateTime now = DateTime.now();

  @override
  void onInit() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      update();
    });

    super.onInit();
  }
}
