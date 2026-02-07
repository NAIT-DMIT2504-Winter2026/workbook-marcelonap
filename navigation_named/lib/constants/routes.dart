import 'package:flutter/material.dart';
import 'package:navigation_named/screens/screen1.dart';
import 'package:navigation_named/screens/screen2.dart';

// Centralized managing of screen names, screen creation and passing arguments
class AppRouter {
  static const screen1 = "/";
  static const screen2 = "/screen2";

  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    if (settings.name == screen2) {
      //Allows for type checking and validation
      // final title = settings.arguments as String? ?? "title not pased";
      return MaterialPageRoute(
        builder: (context) => Screen2(title: settings.arguments as String),
      );
    }
    if (settings.name == screen1) {
      return MaterialPageRoute(
        builder: (context) => Screen1(title: "Screen 1 built centrally"),
      );
    }
  }
}
