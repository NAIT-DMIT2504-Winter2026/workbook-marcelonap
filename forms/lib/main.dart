import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textToDisplay = 'PLaceholder';
  final _formKey = GlobalKey<FormState>();
  void _setText(String value) {
    setState(() {
      textToDisplay = value;
    });
  }

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  int _intHolder = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(label: Text("Useranme")),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username can't be empty";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(label: Text("Password")),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  TextFormField(keyboardType: TextInputType.number),
                  //Custom Form Input example, Allowing us to use whatever widgets we want
                  //to take in different types of input, needs to be fully managed by us, unlinke
                  // the other form field widgets which support the use of controllers
                  FormField<int>(
                    initialValue: _intHolder,
                    builder: (state) {
                      return Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              state.didChange(200);
                              _intHolder = 200;
                            },
                            child: Text("Set value to 200"),
                          ),
                          if (state.hasError)
                            Text(
                              style: TextStyle(color: Colors.red),
                              state.errorText!,
                            ),
                        ],
                      );
                    },
                    validator: (value) {
                      if (value == null || value < 200) {
                        print("Value not changed to 200");
                        return "Value was not changed yet";
                      }
                      return null;
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(
                          "Succesful login with: ${_usernameController.text} and ${_passwordController.text} int: $_intHolder",
                        );
                      } else {
                        _usernameController.clear();
                        _passwordController.clear();
                        _intHolder = 0;
                        _usernameController.text = "Validation failed";
                      }
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
            //   Text(textToDisplay),
            //   Spacer(),
            //   TextField(
            //     onChanged: (newValue) {
            //       print("Text field value changed: $newValue");
            //       _setText(newValue);
            //     },
            //   ),
          ],
        ),
      ),
    );
  }
}
