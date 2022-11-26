import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCustomPainter extends CustomPainter {
  List<Offset?> points = [];

  MyCustomPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroungColor = Paint();
    backgroungColor.color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, Get.width * .8, Get.height * .8);
    canvas.drawRect(rect, backgroungColor);

    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 3.0;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[i]!], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
