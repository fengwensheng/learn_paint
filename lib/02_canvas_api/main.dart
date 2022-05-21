import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_paint/02_canvas_api/paper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(Paper());
}
