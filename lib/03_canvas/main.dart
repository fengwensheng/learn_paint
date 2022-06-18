import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'coordinate.dart';

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
          // painter: CanvasTranslatePainter(),
          // painter: CanvasScalePainter(),
          painter: CanvasCoordinatePainter(),
        ),
      );
}
