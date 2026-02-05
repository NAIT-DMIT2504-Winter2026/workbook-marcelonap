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
        appBar: AppBar(
          title: const Text('Mobile UI Form'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: UserSignupForm(),
        ),
      ),
    );
  }
}

// Create a form to hold the fields

// Now we have no way of accessing the values of all fields when the form is
// "submitted", need a stateful widget and controllers now
class UserSignupForm extends StatefulWidget {
  const UserSignupForm({super.key});

  @override
  State<UserSignupForm> createState() => _UserSignupFormState();
}

// Private state for the new stateful form
class _UserSignupFormState extends State<UserSignupForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<_UserSignupFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      // Now that we have a unique global key, assign it here
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'New User Form',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Change to TextFormField
          TextFormField(
            // Must provide a value
            validator: (value) => value == null || value.trim() == ''
                ? 'Username cannot be empty'
                : null,
            decoration: const InputDecoration(
              label: Text('Username'),
            ),
          ),
          // FormField<String>(
          //   builder: (FormFieldState<String> state) {
          //     return TextField
          //   },
          )
          // Change to TextFormField
          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            // Must provide a value
            validator: (value) => value == null || value.trim() == ''
                ? 'Password cannot be empty'
                : null,
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
          ),
          // Change to ElevatedButton to showcase the difference
          ElevatedButton(
            onPressed: () {
              // test validation of the fields
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
