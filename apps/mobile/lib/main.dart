import 'package:flutter/material.dart';
import 'package:tnyx_mobile/app/tnyx_app.dart';
import 'package:tnyx_mobile/core/config/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.validate();
  runApp(const TnyxApp());
}
