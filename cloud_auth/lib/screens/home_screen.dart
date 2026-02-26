import 'package:cloud_auth/state/app_state.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.appState});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ListenableBuilder(
          listenable: appState,
          builder: (context, _) {
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
        ),
      ),
    );
  }
}
