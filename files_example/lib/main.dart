import 'package:files_example/screens/file_screen.dart';
import 'package:files_example/storage/file_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const homeRoute = "/";
const fileScreenRoute = "/file_screen";

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final fileManager = FileManager();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == homeRoute) {
          return MaterialPageRoute(
            builder: (_) =>
                MyHomePage(title: "My File app", fileManager: fileManager),
          );
        }

        if (settings.name == fileScreenRoute) {
          final fileName = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) =>
                FileScreen(fileName: fileName, fileManager: fileManager),
          );
        }
      },
      initialRoute: homeRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.fileManager});
  final String title;
  final FileManager fileManager;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> files = [];
  final _fieldController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateFilesList();
  }

  void _updateFilesList() {
    widget.fileManager.listAppDirectory().then((value) {
      setState(() {
        files = value;
      });
    });
  }

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
            TextField(controller: _fieldController),
            Spacer(),
            Expanded(
              child: ListView.builder(
                itemCount: files.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //Navigate to next page
                      Navigator.of(
                        context,
                      ).pushNamed(fileScreenRoute, arguments: files[index]);
                    },
                    child: Text(files[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.fileManager.createFile(_fieldController.text);
          _updateFilesList();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
