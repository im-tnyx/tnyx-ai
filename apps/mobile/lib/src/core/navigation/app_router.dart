import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/main_navigation/navigation/shell_routes.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/route/welcome_route.dart';

sealed class AppRoutes {
  static const String welcome = '/welcome';
  static const String mainShell = '/main';
  // Keeping home for legacy/redirection if needed
  static const String home = mainShell;
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute<void>(
          builder: (_) => const WelcomeRoute(),
          settings: settings,
        );
      case AppRoutes.mainShell:
        return MaterialPageRoute<void>(
          builder: (_) => const MainShellRoute(),
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
