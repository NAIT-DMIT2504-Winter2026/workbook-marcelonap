import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Mobile UI Form')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: UserSignupForm(),
        ),
      ),
    );
  }
}

// Create a form to hold the fields
class UserSignupForm extends StatelessWidget {
  const UserSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'New User Form',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          // Change to TextFormField
          TextFormField(
            onChanged: (value) => {print('Username changed: $value')},
            validator: (value) => value == null || value.trim() == ''
                ? 'Username cannot be empty'
                : null,
            decoration: const InputDecoration(label: Text('Username')),
          ),
          // Change to TextFormField
          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(label: Text('Password')),
          ),
          // Change to ElevatedButton to showcase the difference
          ElevatedButton(onPressed: () => false, child: const Text('Sign Up')),
        ],
      ),
    );
  }
}

// Now we have no way of accessing the values of all fields when the form is
// "submitted", need a stateful widget and controllers now
