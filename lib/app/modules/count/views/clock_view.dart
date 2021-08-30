import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:time_pomodoro/app/modules/count/controllers/count_controller.dart';

class ClockView extends GetView<CountController> {
  final double size;

  ClockView({required this.size});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountController>(
      init: CountController(),
      initState: (_) {},
      builder: (_) {
        return Container(
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
      ..strokeWidth = 1;

    var outlineBrush = Paint()
      ..color = Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;

    var centerDotBrush = Paint()..color = Color(0xffeaecff);

    var secHandBrush = Paint()
      ..color = Colors.orange[300] as Color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.redAccent, Colors.yellow])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.blue])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;

    canvas.drawCircle(center, radius * 0.75, fillBrush);
    canvas.drawCircle(center, radius * 0.75, outlineBrush);

    var hourHandX = centerX +
        radius *
            0.4 *
            cos(dateTime.hour * 30 + dateTime.minute * 0.5 * pi / 180);
    var hourHandY = centerX +
        radius *
            0.75 *
            sin(dateTime.hour * 30 + dateTime.minute * 0.5 * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + radius * 0.6 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + radius * 0.6 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + radius * 0.6 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, radius * 0.12, centerDotBrush);

    var outlineCircleRadius = radius;
    var innerCircleRadius = radius * 0.9;
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
