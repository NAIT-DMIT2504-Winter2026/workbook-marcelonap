import 'package:cloud_auth/firebase_options.dart';
//Preventing import conflicts with firebase_ui_auth EmailAuthprovider
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  AppState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  Future<void> init() async {
    print("@AppState.init: initializing firebase Services");
    //Initialized firebase services for this app
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders([EmailAuthProvider()]);

    subscribeToUserChanges();
  }

  Future<void> subscribeToUserChanges() async {
    print("@subscribeToUserChanges: subscribing to user changes");
    // Listening to user changes in our firebase auth instance to update our
    // State accordingly
    FirebaseAuth.instance.userChanges().listen((user) {
      print("@subscribeToUserChanges: received user: $user");
      if (user == null) {
        //Set our state to reflect no user
        _loggedIn = false;
      } else {
        // Set our state to reflect a logged in user
        _loggedIn = true;
      }
    });
    notifyListeners();
  }
}
