import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// I hide email auth provider to prevent import collisions between this and
// firebase ui auth above
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import 'package:riverpod_example/firebase_options.dart';

class TodoRepository {
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
    _subscribeToUserChanges();
  }
  // USER EVENT HANDLERS:

  // Doing DB operations
  // Notifying UI
  // Public method, accesible by the UI
  Future<void> onAdd(Todo newTodo) async {
    await _addTodo(newTodo);
    await refreshTodoList();
  }

  Future<void> onDelete(Todo todoToDelete) async {
    await _deleteTodo(todoToDelete);
    await refreshTodoList();
  }

  void onUpdate(Todo todoToUpdate) async {
    //await _updateTodo(todoToUpdate); // YOU IMPLEMENT THIS AS AN EXERCISE
    refreshTodoList();
  }

  Future<void> refreshTodoList() async {
    await _fetchTodos();
  }

  // DATABASE OPERATIONS

  Future<void> _fetchTodos() async {
    if (user == null) {
      print("@fetchTodos: No user to fetch from");
      return;
    }

    await FirebaseFirestore.instance
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

  // Private method, not accesible by the UI, to do a real database Operation
  Future<void> _addTodo(Todo newTodo) async {
    if (user == null) {
      print("@fetchTodos: No user to fetch from");
      return;
    }

    await FirebaseFirestore
        .instance // Find a nicer way to access the firestore instance everytime you need it
        .collection('todos/${user!.uid}/todos')
        .doc()
        .set(newTodo.toMap())
        .onError((e, _) {
          print("@addTodo: Something went wrong adding a TODO: $e");
        });
  }

  Future<void> _deleteTodo(Todo todo) async {
    if (user == null) {
      print("@fetchTodos: No user to fetch from");
      return;
    }

    await FirebaseFirestore.instance
        .collection('todos/${user!.uid}/todos')
        .doc(todo.id)
        .delete()
        .onError((e, _) {
          print("@deleteTodo: Something went wrong deleting a todo: $e");
        });
  }

  Future<void> _updateTodo(Todo todo) async {
    // For you to implement
  }

  Future<void> _subscribeToUserChanges() async {
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
    });
  }
}

final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) => TodoRepository(),
);
