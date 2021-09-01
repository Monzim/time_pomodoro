import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController {
  static const Duration countDownDuration = Duration(seconds: 10);
  // ignore: prefer_const_constructors
  Rx<Duration> duration = Duration().obs;
  Timer? timer;

  Rx<bool> isCountDown = true.obs;
  Rx<bool> isRunning = false.obs;

  @override
  void onInit() {
    // startTimmer();
    resetTimer();
    super.onInit();
  }

  void startTimmer({bool isReset = true}) {
    if (isReset) {
      resetTimer();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    if (timer == null) {
      isRunning.value = false;
    } else {
      isRunning.value = timer!.isActive;
    }
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer?.cancel();
  }

  void resetTimer() {
    if (isCountDown.value) {
      duration.value = countDownDuration;
    } else {
      // ignore: prefer_const_constructors
      duration.value = Duration();
    }
  }

  void addTime() {
    final int addSecond = isCountDown.value ? -1 : 1;
    final int seconds = duration.value.inSeconds + addSecond;

    if (seconds < 0) {
      timer?.cancel();
    } else {
      duration.value = Duration(seconds: seconds);
    }
  }
}
