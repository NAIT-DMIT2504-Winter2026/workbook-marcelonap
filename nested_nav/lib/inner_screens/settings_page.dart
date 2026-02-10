import 'package:flutter/material.dart';
import 'package:nested_nav/constants/navigation.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Settings"),
            TextButton(
              onPressed: () {
                AppNav.settingsNav.currentState!.pushNamed(
                  AppNav.settingsScreenOption1,
                );
              },
              child: Text("Option1"),
            ),
            TextButton(
              onPressed: () {
                AppNav.settingsNav.currentState!.pushNamed(
                  AppNav.settingsScreenOption2,
                );
              },
              child: Text("Option2"),
            ),
            TextButton(
              onPressed: () {
                AppNav.settingsNav.currentState!.pushNamed(
                  AppNav.settingsScreenOption3,
                );
              },
              child: Text("Option3"),
            ),
          ],
        ),
      ),
    );
  }
}
