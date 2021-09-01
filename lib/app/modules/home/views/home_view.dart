import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                controller.buildTime(),
                const SizedBox(width: 10, height: 10),
                if (controller.isRunning.value)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            controller.stopTimer();
                          },
                          child: const Text('Cancel')),
                      const SizedBox(width: 10, height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.isRunning.value) {
                            controller.stopTimer(reset: false);
                          } else {
                            controller.startTimmer(isReset: false);
                          }
                        },
                        child: Text(
                            controller.isRunning.isTrue ? 'Stop' : 'Resume'),
                      )
                    ],
                  )
                else
                  ElevatedButton(
                      onPressed: () {
                        controller.startTimmer();
                      },
                      child: const Text('Start Time')),
              ],
            )),
      ),
    );
  }
}
