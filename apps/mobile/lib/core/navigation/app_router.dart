import 'package:flutter/material.dart';
import 'package:tnyx_mobile/features/home/presentation/home_route.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_route.dart';

sealed class AppRoutes {
  static const String welcome = '/welcome';
  // Temporary path; will later be replaced by onboarding-owned home entry route.
  static const String home = '/temp-home';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute<void>(
          builder: (_) => const WelcomeRoute(),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          builder: (_) => const HomeRoute(),
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
