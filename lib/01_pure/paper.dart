import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  @override
  Widget build(_) => Container(
        color: Colors.white,
        child: CustomPaint(
          painter: PaperPainter(),
        ),
      );
}

class PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) => canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        100,
        Paint()..color = Colors.deepPurple,
      );

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
