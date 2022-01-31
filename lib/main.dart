import 'package:flutter/material.dart';
import 'package:player/router/routers.dart' as routes;
import 'package:player/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nacheza',
      theme: ThemeData(),
      onGenerateRoute: routes.controller,
      initialRoute: routes.onboardingScreen,
    );
  }
}
