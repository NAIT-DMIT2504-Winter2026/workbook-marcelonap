import 'package:firebase_setup_in_class_demo/screens/home_page.dart';
import 'package:firebase_setup_in_class_demo/screens/todo_list.dart';
import 'package:firebase_setup_in_class_demo/state/provide_state.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_setup_in_class_demo/state/app_state.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // var instance = FirebaseAuth.instanceFor(app: Firebase.app());
  // instance.signInWithCredential(AuthCredential(providerId: providerId, signInMethod: signInMethod)))

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => HomePage(),
        '/todo-list': (context) => TodoList(),
        '/sign-in': (context) => SignInScreen(
          actions: [
            AuthStateChangeAction((ontext, state) {
              final user = switch (state) {
                SignedIn state => state.user,
                UserCreated state => state.credential.user,
                _ => null,
              };
              if (user == null) return;
              if (state is UserCreated) {
                user.updateDisplayName(user.email!.split('@').first);
              }

              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            }),
          ],
        ),
        '/profile': (context) => ProfileScreen(
          actions: [
            SignedOutAction((context) {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            }),
          ],
        ),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
