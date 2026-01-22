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
