import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:time_pomodoro/app/modules/count/controllers/count_controller.dart';

class ClockView extends GetView<CountController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountController>(
      init: CountController(),
      initState: (_) {},
      builder: (_) {
        return Container(
          width: 300,
          height: 300,
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
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xff444974);
    var dashBrush = Paint()
      ..color = Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 2;

    var outlineBrush = Paint()
      ..color = Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerDotBrush = Paint()..color = Color(0xffeaecff);

    var secHandBrush = Paint()
      ..color = Colors.orange[300] as Color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.redAccent, Colors.yellow])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.blue])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    var hourHandX = centerX +
        60 * cos(dateTime.hour * 30 + dateTime.minute * 0.5 * pi / 180);
    var hourHandY = centerX +
        60 * sin(dateTime.hour * 30 + dateTime.minute * 0.5 * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerDotBrush);

    var outlineCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (var i = 0; i < 360; i += 12) {
      var x1 = centerX + outlineCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outlineCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}