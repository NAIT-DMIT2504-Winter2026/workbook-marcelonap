import 'package:firebase_setup_in_class_demo/models/todo.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_setup_in_class_demo/firebase_options.dart';
// I hide email auth provider to prevent import collisions between this and
// firebase ui auth above
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:cloud_firestore/cloud_firestore.dart';

// By extending change notifier I make this class listenable
// Other classes can listen for changes and respond to them
class ApplicationState extends ChangeNotifier {
  // This class's job is to broadcast changes in firebase to the rest of the app
  ApplicationState() {
    // Call the init function to connect to firebase and setup listeners
    init();
  }
  // Add a way to fetch from the database cloud_firestore
  // Add a way to add to our database
  // Delete
  // Update
  // Notify the screen, when state has changed. [x]

  // Boolean tracks whether or not a user is logged in
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  User? _user;
  User? get user => _user;

  List<Todo> _todoList = [];
  List<Todo> get todoList => _todoList;

  // Connects the app state to firebase auth and initializes
  // firebase connection to the app itself
  Future<void> init() async {
    // Connect to firebase before starting the app
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Configure auth providers, telling firebase ui auth screens
    // to show/work with email login
    FirebaseUIAuth.configureProviders([EmailAuthProvider()]);

    // Set up User Stream observability to react to changes in the firebase auth user
    subscribeToUserChanges();
  }

  void _fetchTodos() {
    if (user == null) {
      print("@fetchTodos: No user to fetch from");
      return;
    }

    FirebaseFirestore.instance
        .collection('todos/${user!.uid}/todos')
        .get()
        .then((todosSnapshot) {
          // Convert items in here to actual TODOS
          _todoList = todosSnapshot.docs
              .map((e) => Todo.fromFirestore(e))
              .toList();
          print("@fetchTodos: Fetched ${todosSnapshot.docs.first.data()}");
        });
  }

  void addTodo(Todo newTodo) {
    if (user == null) {
      print("@fetchTodos: No user to fetch from");
      return;
    }

    FirebaseFirestore.instance
        .collection('todos/${user!.uid}/todos')
        .doc()
        .set(newTodo.toMap())
        .onError((e, _) {
          print("@addTodo: Something went wrong adding a TODO: $e");
        });
  }

  Future<void> subscribeToUserChanges() async {
    // Whenever firebase auth user changes (user logs in or out)
    // notify all my listeners of that change
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user == null) {
        _user = null;
        _loggedIn = false;
      } else {
        _user = user;
        _loggedIn = true;
        _fetchTodos();
      }
      notifyListeners();
    });
  }
}
