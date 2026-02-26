import 'package:cloud_auth/state/app_state.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_auth/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppState state = AppState();
  runApp(MyApp(state: state));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.state});
  final AppState state;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => HomeScreen(appState: state),
        '/sign-in': (context) => SignInScreen(
          actions: [
            AuthStateChangeAction((context, state) {
              print(
                "@authStateChangedActionCallback: state was changed, new state: $state",
              );
              if (state is AuthFailed) {
                print("REASON FOR FAILING: ${state.exception}");
              }
              final user = switch (state) {
                SignedIn signedInState => signedInState.user,
                UserCreated createdState => createdState.credential.user,
                _ => null,
              };
              if (user == null) return;

              if (state is UserCreated) {
                user.updateDisplayName(user.email!.split('@').first);
              }

              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed("/");
            }),
          ],
        ),
        '/profile': (context) => ProfileScreen(
          actions: [
            SignedOutAction((context) {
              print("@signedOutAction: Signing out received");
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed("/");
            }),
            // AuthStateChangeAction((context, state) {
            //   print("@Profile.authStateChanged: new State: $state");
            // }),
          ],
        ),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
