import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController {
  static const countDownDuration = Duration(seconds: 10);
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

    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
    isRunning.value = timer == null ? false : timer!.isActive;
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
      duration.value = Duration();
    }
  }

  void addTime() {
    final addSecond = isCountDown.value ? -1 : 1;
    final seconds = duration.value.inSeconds + addSecond;

    if (seconds < 0) {
      timer?.cancel();
    } else
      duration.value = Duration(seconds: seconds);
  }
}
