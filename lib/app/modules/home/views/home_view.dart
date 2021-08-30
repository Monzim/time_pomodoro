import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Widget buildTime() {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes =
          twoDigits(controller.duration.value.inMinutes.remainder(60));

      final seconds =
          twoDigits(controller.duration.value.inSeconds.remainder(60));

      return Text(
        '$minutes : $seconds',
        style: GoogleFonts.ubuntu(fontSize: 60, color: Colors.black),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildTime(),
                SizedBox(width: 10, height: 10),
                controller.isRunning.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                controller.stopTimer();
                              },
                              child: Text('Cancel')),
                          SizedBox(width: 10, height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (controller.isRunning.value) {
                                controller.stopTimer(reset: false);
                              } else {
                                controller.startTimmer(isReset: false);
                              }
                            },
                            child: Text(controller.isRunning.isTrue
                                ? 'Stop'
                                : 'Resume'),
                          )
                        ],
                      )
                    : ElevatedButton(
                        onPressed: () {
                          controller.startTimmer();
                        },
                        child: Text('Start Time')),
              ],
            )),
      ),
    );
  }
}
