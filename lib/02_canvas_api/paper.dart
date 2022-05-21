import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  @override
  Widget build(_) => Container(
        color: Colors.white,
        child: CustomPaint(
          painter: PathFillPainter(),
        ),
      );
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) => canvas.drawLine(
        Offset(0, 0),
        Offset(100, 100),
        Paint()
          ..color = Colors.orange
          ..strokeWidth = 5,
      );

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PathLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      Path()
        ..lineTo(size.width / 2, size.height / 2)
        ..lineTo(size.width, 0),
      Paint()
        ..color = Colors.deepPurple
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PathFillPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      Path()
        ..lineTo(size.width / 2, size.height / 2)
        ..lineTo(size.width, 0),
      Paint()
        ..color = Colors.deepPurple
        ..strokeWidth = 5
        ..style = PaintingStyle.fill, //default
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
