import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(_) => Container(
        color: Colors.white,
        child: CustomPaint(
          painter: CanvasScalePainter(),
        ),
      );
}

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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CanvasScalePainter extends CustomPainter {
  final unit = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);

    _drawRightTop(canvas, size);

    canvas.save();
    canvas.scale(-1, 1);
    _drawRightTop(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1);
    _drawRightTop(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(1, -1);
    _drawRightTop(canvas, size);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  void _drawRightTop(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < size.height / 2 / unit; i++) {
      canvas.drawLine(
        Offset(0, 0),
        Offset(size.width / 2, 0),
        Paint()..color = Colors.grey,
      );
      canvas.translate(0, -unit);
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
}
