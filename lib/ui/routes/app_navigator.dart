import 'package:flutter_new_test/ui/pages/chart_screen/chart_screen.dart';
import 'package:flutter_new_test/ui/pages/login_screen/login_screen.dart';

import 'package:flutter_new_test/ui/pages/settings_screen/settings_screen.dart';
import 'package:flutter_new_test/ui/pages/start_screen/start_screen.dart';
import 'package:flutter_new_test/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const StartScreen(),
      ),
      GoRoute(
        path: AppRoutes.chart,
        builder: (context, state) => const ChartScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
  static GoRouter get router => _router;
}
