import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_painting_app/models/drwing_area_model.dart';
import 'package:get/get.dart';

class MyCustomPainter extends CustomPainter {
  List<DrwingAreaModel?> points = [];
  Color selctedColor;
  double strokeWidth;

  MyCustomPainter({
    required this.points,
    required this.selctedColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroungColor = Paint();
    backgroungColor.color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, Get.width * .8, Get.height * .8);
    canvas.drawRect(rect, backgroungColor);

    for (int i = 0; i < points.length; i++) {
      if (points[i] != null && points[i + 1] != null) {
        Paint? paint = points[i]!.areaPaint;
        canvas.drawLine(points[i]!.point!, points[i + 1]!.point!, paint!);
      } else if (points[i] != null && points[i + 1] == null) {
        Paint? paint = points[i]!.areaPaint;
        canvas.drawPoints(PointMode.points, [points[i]!.point!], paint!);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
