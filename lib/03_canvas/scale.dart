import 'dart:math';

import 'package:flutter/material.dart';

class CanvasScalePainter extends CustomPainter {
  final unit = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);
    _drawGrid(canvas, size);
    _drawCircle(canvas);
    _drawLines(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _drawBottomRight(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < size.height / 2 / unit; i++) {
      canvas.drawLine(
        Offset(0, 0),
        Offset(size.width / 2, 0),
        Paint()..color = Colors.grey,
      );
      canvas.translate(0, unit);
    }
    canvas.restore();
    canvas.save();
    for (int i = 0; i < size.width / 2 / unit; i++) {
      canvas.drawLine(
        Offset(0, 0),
        Offset(0, size.height / 2),
        Paint()..color = Colors.grey,
      );
      canvas.translate(unit, 0);
    }
    canvas.restore();
  }

  void _drawGrid(Canvas canvas, Size size) {
    _drawBottomRight(canvas, size);

    canvas.save();
    canvas.scale(-1, 1);
    _drawBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1);
    _drawBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(1, -1);
    _drawBottomRight(canvas, size);
    canvas.restore();
  }

  void _drawCircle(Canvas canvas) => canvas.drawCircle(
        Offset(0, 0),
        unit * 3,
        Paint()..color = Colors.orange,
      );

  void _drawLines(Canvas canvas) {
    canvas.save();
    for (int i = 0; i < 12; i++) {
      canvas.rotate(-2 * pi / 12);
      canvas.drawLine(
        Offset(5 * unit, 0),
        Offset(5 * unit + unit, 0),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = unit / 2
          ..strokeCap = StrokeCap.round,
      );
    }
    canvas.restore();
  }
}
