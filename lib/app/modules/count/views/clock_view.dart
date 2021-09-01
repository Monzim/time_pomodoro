import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:time_pomodoro/app/modules/count/controllers/count_controller.dart';

class ClockView extends GetView<CountController> {
  const ClockView({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountController>(
      init: CountController(),
      initState: (_) {},
      builder: (_) {
        return SizedBox(
          width: size,
          height: size,
          child: Transform.rotate(
            angle: -pi / 2,
            child: CustomPaint(
              painter: ClockPainter(),
            ),
          ),
        );
      },
    );
  }
}

class ClockPainter extends CustomPainter {
  DateTime dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final Offset center = Offset(centerX, centerY);
    final double radius = min(centerX, centerY);

    final Paint fillBrush = Paint()..color = const Color(0xff444974);
    final Paint dashBrush = Paint()
      ..color = const Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 1;

    final Paint outlineBrush = Paint()
      ..color = const Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;

    final Paint centerDotBrush = Paint()..color = const Color(0xffeaecff);

    final Paint secHandBrush = Paint()
      // ignore: cast_nullable_to_non_nullable
      ..color = Colors.orange[300] as Color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    final Paint minHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: <Color>[Colors.redAccent, Colors.yellow])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    final Paint hourHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: <Color>[Colors.lightBlue, Colors.blue])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;

    canvas.drawCircle(center, radius * 0.75, fillBrush);
    canvas.drawCircle(center, radius * 0.75, outlineBrush);

    final double hourHandX = centerX +
        radius *
            0.4 *
            cos(dateTime.hour * 30 + dateTime.minute * 0.5 * pi / 180);
    final double hourHandY = centerX +
        radius *
            0.75 *
            sin(dateTime.hour * 30 + dateTime.minute * 0.5 * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    final double minHandX =
        centerX + radius * 0.6 * cos(dateTime.minute * 6 * pi / 180);
    final double minHandY =
        centerX + radius * 0.6 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    final double secHandX =
        centerX + radius * 0.6 * cos(dateTime.second * 6 * pi / 180);
    final double secHandY =
        centerX + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, radius * 0.12, centerDotBrush);

    final double outlineCircleRadius = radius;
    final double innerCircleRadius = radius * 0.9;
    for (int i = 0; i < 360; i += 12) {
      final double x1 = centerX + outlineCircleRadius * cos(i * pi / 180);
      final double y1 = centerX + outlineCircleRadius * sin(i * pi / 180);

      final double x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      final double y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
