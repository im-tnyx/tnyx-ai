import 'package:flutter/material.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_route.dart';

sealed class AppRoutes {
  static const String welcome = '/welcome';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute<void>(
          builder: (_) => const WelcomeRoute(),
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
