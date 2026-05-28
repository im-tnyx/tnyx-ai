import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tnyx_mobile/app/tnyx_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Edge-to-edge display enable karein
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Global system UI style set karein
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  ));

  runApp(const TnyxApp());
}
