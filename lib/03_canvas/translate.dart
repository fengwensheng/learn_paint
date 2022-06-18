import 'dart:math';

import 'package:flutter/material.dart';

class CanvasTranslatePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);
    canvas.drawCircle(
      Offset(0, 0),
      100,
      Paint()..color = Colors.deepPurple,
    );
    canvas.drawLine(
      Offset(0, 0),
      Offset(100 / sqrt(2), 100 / sqrt(2)),
      Paint()
        ..color = Colors.orange
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.butt,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
