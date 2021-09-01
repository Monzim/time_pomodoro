import 'dart:async';

import 'package:get/get.dart';

class TimeController extends GetxController {
  RxInt maxCount = 10.obs;
  RxDouble timePointer = 0.0.obs;

  Timer? timer;
  String getText() {
    return timePointer.value.toStringAsFixed(2);
  }

  Future<void> updateMaxCount(int value) async {
    maxCount.value = value;
  }

  Future<void> updateTimePointerValue() async {
    timePointer.value++;
    print('Time Update + ${timePointer.value}');
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

  // RxInt initialCountValue = 25.obs;

  // RxInt counter = 25.obs;
  // RxDouble clockValue = 0.0.obs;

  // Timer? timer;

  // void startTimer() {
  //   timer = Timer.periodic(
  //     const Duration(seconds: 1),
  //     (Timer timer) {
  //       if (counter.value > 0) {
  //         counter.value--;
  //         print('Clock value ${clockValue.value}');
  //         clockValue.value++;
  //       } else {
  //         timer.cancel();
  //         setCountValue(timerValue: 30);
  //       }
  //     },
  //   );
  // }

  // Future<void> setCountValue({required int timerValue}) async {
  //   counter.value = timerValue;
  //   clockValue.value = 0.0;
  // }
}
