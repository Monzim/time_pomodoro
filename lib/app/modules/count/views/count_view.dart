import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:time_pomodoro/app/modules/count/views/clock_view.dart';

import '../controllers/count_controller.dart';

class CountView extends GetView<CountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CountView'),
        centerTitle: true,
      ),
      body: Center(
        child: ClockView(),
      ),
    );
  }
}
