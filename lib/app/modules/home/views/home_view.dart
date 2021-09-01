import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Widget buildTime() {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final String minutes =
          twoDigits(controller.duration.value.inMinutes.remainder(60));

      final String seconds =
          twoDigits(controller.duration.value.inSeconds.remainder(60));

      return Text(
        '$minutes : $seconds',
        style: GoogleFonts.ubuntu(fontSize: 60, color: Colors.black),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTime(),
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
