import 'package:cloud_auth/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Consumer<AppState>(
          builder: (context, appState, _) {
            return appState.loggedIn
                ? ElevatedButton(
                    onPressed: () {
                      //coming soon
                      Navigator.of(context).pushNamed('/profile');
                    },
                    child: Text("Profile"),
                  )
                : ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sign-in');
                    },
                    child: Text("Sign-in"),
                  );
          },
          child: Text("Loading..."),
        ),
      ),
    );
  }
}
