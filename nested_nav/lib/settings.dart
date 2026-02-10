import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested_nav/constants/navigation.dart';
import 'package:nested_nav/constants/controllers.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Navigator(
        key: AppNav.settingsNav,
        initialRoute: AppNav.settingsScreenRoot,
        onGenerateRoute: AppNav.generateRoutes,
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      title: Text("Settings page"),
      leading: IconButton(
        onPressed: () {
          if (AppNav.settingsNav.currentState!.canPop()) {
            AppNav.settingsNav.currentState!.pop();
          } else {
            AppNav.mainNav.currentState!.pop(fieldController.text);
          }
        },
        icon: Icon(Icons.arrow_back),
      ),
    );
  }
}
