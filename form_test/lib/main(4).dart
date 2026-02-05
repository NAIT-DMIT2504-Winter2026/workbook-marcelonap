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

  // Create a controller for access to the field values
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Must manually clean up controllers to release resources
  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
          // Updated to custom input
          UsernameInput(
            controller: _usernameController,
          ),
          // Update to custom fiele
          PasswordFormField(
            controller: _passwordController,
            validator: // example of passing in validator
                (value) => value == null || value.trim() == ''
                    ? 'Password cannot be empty'
                    : null,
          ),
          // Change to ElevatedButton to showcase the difference
          ElevatedButton(
            onPressed: () {
              // test validation of the fields
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  // Update to display the two field values
                  SnackBar(
                    // content: Text('Processing Data...'),
                    content: Text(
                        'Username: ${_usernameController.text}; Password: ${_passwordController.text}'),
                  ),
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

// Let's clean up the form a little bit

// Custom input widget example extending StatefulWidget
class UsernameInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const UsernameInput({
    Key? key,
    required this.controller,
    // For internationalization
    this.label = 'Username',
  }) : super(key: key);
  @override
  State<UsernameInput> createState() => _UsernameInputState();
}

class _UsernameInputState extends State<UsernameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Assign the appropriate controller
      controller: widget.controller,
      // Must provide a value
      validator: (value) => value == null || value.trim() == ''
          ? 'Username cannot be empty' // should be internationalized too...
          : null,
      decoration: InputDecoration(
        label: Text(widget.label),
      ),
    );
  }
}

// Custom input widget example extending FormField<Type>
class PasswordFormField extends FormField<String> {
  final TextEditingController controller;
  final String label;

  PasswordFormField({
    Key? key,
    FormFieldSetter<String>? onSaved,
    required this.controller,
    // For internationalization
    this.label = 'Password',
    FormFieldValidator<String>? validator,
  }) : super(
          key: key,
          validator: validator,
          builder: (FormFieldState<String> state) {
            // _PasswordFormFieldState state = field as _PasswordFormFieldState;
            return TextFormField(
              // Assign the appropriate controller
              controller: controller,
              validator: validator,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                label: Text(label),
              ),
              // required to enforce correct validation of this field
              onChanged: (value) {
                state.didChange(value);
              },
            );
          },
        );
}

// If necessary, you can also override the createState method and implement
// your own FormFieldState<Type> class

