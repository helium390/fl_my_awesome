import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgress extends CustomPainter {
  double currentProgress;
  Color color;
  Color bgColor;
  bool isPoint;
  double strokeWidth;

  CircleProgress({
    required this.currentProgress,
    required this.color,
    required this.bgColor,
    this.isPoint = true,
    this.strokeWidth = 18,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = strokeWidth
      ..color = bgColor
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;
    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle
    double angle = 2 * pi * (currentProgress / 100);
    final offset = Offset(
      center.dx + radius * cos(-pi / 2 + angle),
      center.dy + radius * sin(-pi / 2 + angle),
    );
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);

    /// small circle at the end of the arc
    if (isPoint) {
      canvas.drawCircle(
        offset,
        5,
        Paint()
          ..strokeWidth = 5
          ..color = Colors.white
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
