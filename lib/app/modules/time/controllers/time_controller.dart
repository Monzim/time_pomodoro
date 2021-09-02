import 'dart:async';

import 'package:get/get.dart';

class TimeController extends GetxController {
  RxInt maxCount = 10.obs;
  RxDouble timePointer = 0.0.obs;

  Timer? timer;

  String getTimeText(int second) {
    final int _sec = timePointer.value.toInt() % 60;
    final int _min = (timePointer.value ~/ 60) % 60;

    if (_min < 9 && _sec > 9) {
      return '0$_min:$_sec';
    } else if (_sec < 10) {
      return '0$_min:0$_sec';
    } else {
      return '00:00';
    }
  }

  Future<void> updateMaxCount(int value) async {
    maxCount.value = value;
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (timePointer.value < maxCount.value) {
          updateTimePointerValue();
        } else {
          // isTimerRunning.toggle();
          timer.cancel();

          timePointer.value = 0;
          print('Timer Canceled !!!');
        }
      },
    );
  }

  Future<void> updateTimePointerValue() async {
    timePointer.value++;
    print('Time Update + ${timePointer.value}');
  }
}
