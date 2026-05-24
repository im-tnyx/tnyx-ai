import 'package:flutter/material.dart';
import 'package:tnyx_mobile/features/home/presentation/temp_home_screen.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_route.dart';

sealed class AppRoutes {
  static const String welcome = '/welcome';
  static const String tempHome = '/temp-home';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute<void>(
          builder: (_) => const WelcomeRoute(),
          settings: settings,
        );
      case AppRoutes.tempHome:
        return MaterialPageRoute<void>(
          builder: (_) => const TempHomeScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const WelcomeRoute(),
          settings: settings,
        );
    }
  }
}
