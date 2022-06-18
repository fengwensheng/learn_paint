import 'package:flutter/material.dart';

class CanvasCoordinatePainter extends CustomPainter {
  final unit = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);
    _drawGrid(canvas, size);
    _drawCoordinate(canvas, size);
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

  void _drawCoordinate(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple
      ..strokeWidth = 1;
    //x
    canvas.drawLine(
      Offset(-size.width / 2, 0),
      Offset(size.width / 2, 0),
      paint,
    );
    //y
    canvas.drawLine(
      Offset(0, -size.height / 2),
      Offset(0, size.height / 2),
      paint,
    );
    //right-arrow

    canvas.drawLine(
      Offset(size.width / 2 - 10, -10),
      Offset(size.width / 2, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2 - 10, 10),
      Offset(size.width / 2, 0),
      paint,
    );
    //up-arrow
    canvas.drawLine(
      Offset(-10, -size.height / 2 + 10),
      Offset(0, -size.height / 2),
      paint,
    );
    canvas.drawLine(
      Offset(10, -size.height / 2 + 10),
      Offset(0, -size.height / 2),
      paint,
    );
  }
}
