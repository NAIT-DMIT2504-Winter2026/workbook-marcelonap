import 'package:flutter/material.dart';
import 'package:stateless_app/main.dart';
import 'package:stateless_app/page2.dart';

class AppRouter {
  static const home = '/';
  static const page2 = '/page2';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const MyHomePage());

      case page2:
        final name = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Page2(name: name));
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
