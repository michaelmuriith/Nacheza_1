import 'package:flutter/material.dart';
import 'package:Gamegig/router/routers.dart' as routes;
import 'package:Gamegig/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nacheza',
      theme: ThemeData(),
      onGenerateRoute: routes.controller,
      initialRoute: routes.onboardingScreen,
    );
  }
}
