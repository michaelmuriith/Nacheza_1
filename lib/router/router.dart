import 'package:flutter/material.dart';

import 'routes.dart';
import '../views/views.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginView:
      return MaterialPageRoute(
          builder: (context) => const AuthenticationView());
    case AppRoutes.onboardingScreen:
      return MaterialPageRoute(builder: (context) => const OnboardingScreen());
    default:
      return MaterialPageRoute(
          builder: (context) => const AuthenticationView());
  }
}
