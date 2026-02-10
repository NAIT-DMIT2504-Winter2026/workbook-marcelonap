import 'package:flutter/material.dart';
import 'package:nested_nav/inner_screens/settings_page.dart';
import 'package:nested_nav/inner_screens/option1.dart';
import 'package:nested_nav/inner_screens/option2.dart';
import 'package:nested_nav/inner_screens/option3.dart';

class AppNav {
  static final mainNav = GlobalKey<NavigatorState>();
  static final settingsNav = GlobalKey<NavigatorState>();

  static const String settingsScreen = "/settings_screen";
  static const String mainScreen = "/";
  static const String settingsScreenRoot = "/";
  static const String settingsScreenOption1 = "/option1";
  static const String settingsScreenOption2 = "/option2";
  static const String settingsScreenOption3 = "/option3";

  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case settingsScreenOption1:
        return MaterialPageRoute(builder: (_) => Option1());
      case settingsScreenOption2:
        return MaterialPageRoute(builder: (_) => Option2());
      case settingsScreenOption3:
        return MaterialPageRoute(builder: (_) => Option3());
      case settingsScreenRoot:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => SettingsPage());
    }
  }
}
