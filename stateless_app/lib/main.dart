import 'package:flutter/material.dart';
import 'package:stateless_app/theme/theme.dart';
import 'package:stateless_app/theme/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Archivo", "Alice");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system, // ALready default themeMode value
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple layout demo")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Employee Profile",
                  style: TextStyle(
                    fontSize: 40.0, // Set the desired font size
                    fontWeight:
                        FontWeight.bold, // Other style properties can be added
                  ),
                ),
                CircleAvatar(
                  radius: 120.0,
                  backgroundImage: AssetImage("images/prison_mike.jpeg"),
                ),
                Text(
                  "Employee Name",
                  style: TextStyle(
                    fontSize: 20.0, // Set the desired font size
                    fontWeight:
                        FontWeight.bold, // Other style properties can be added
                  ),
                ),
              ],
            ),
          ),
          LabelWidget(key, "Role", "Developer"),
          LabelWidget(key, "Team", "Front-end Main Product"),
          LabelWidget(key, "Handle", "@NateAtNait"),
          LabelWidget(key, "Supervisor", "Sally Anne"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.error,
        onPressed: () => {print("Hello from Button")},
      ),
    );
  }
}

class LabelWidget extends StatelessWidget {
  final String title;
  final String value;

  const LabelWidget(Key? key, this.title, this.value) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "$title: ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        Text(value, style: TextStyle(fontSize: 20.0)),
      ],
    );
  }
}
