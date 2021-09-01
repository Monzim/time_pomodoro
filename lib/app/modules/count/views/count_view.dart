import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_pomodoro/app/modules/count/views/clock_view.dart';

import '../controllers/count_controller.dart';

class CountView extends GetView<CountController> {
  @override
  Widget build(BuildContext context) {
    final String formattedTime = DateFormat('HH:mm').format(controller.now);
    final String formattedDate =
        DateFormat('EEE, d MMM').format(controller.now);
    final String timeZoneString =
        controller.now.timeZoneOffset.toString().split('.').first;

    String offsetSign = '';
    if (!timeZoneString.startsWith('-')) offsetSign = '+';
    print(timeZoneString);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  MenuButton(icon: Icons.timelapse, label: 'Clock'),
                  MenuButton(icon: Icons.alarm, label: 'Alarm'),
                  MenuButton(icon: Icons.timer, label: 'Timer'),
                  MenuButton(icon: Icons.stop_circle, label: 'StopWatch'),
                ],
              ),
              const VerticalDivider(
                color: Colors.white,
                width: 2,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Flexible(
                        // flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          'Clock',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(formattedTime,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 64,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(formattedDate,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        fit: FlexFit.tight,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ClockView(
                            size: MediaQuery.of(context).size.height / 2,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('Timezone',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                )),
                            const SizedBox(width: 10, height: 16),
                            Row(
                              children: <Widget>[
                                const Icon(Icons.language, color: Colors.white),
                                const SizedBox(width: 16, height: 10),
                                Text(
                                  'UTC $offsetSign $timeZoneString',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    required this.label,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: TextButton(
          onPressed: () {},
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 10, height: 16),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          )),
    );
  }
}
