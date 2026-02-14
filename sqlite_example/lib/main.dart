import 'package:flutter/material.dart';
import 'package:sqlite_example/managers/dog_db_manager.dart';
import 'package:sqlite_example/models/dog.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> dogs = [];
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _ageController = TextEditingController();

  void _updateDogs() {
    DogDatabaseManager.instace.getDogs().then((value) {
      setState(() {
        dogs = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateDogs();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ageController.dispose();
    _nameController.dispose();
    _idController.dispose();
    DogDatabaseManager.instace.closeDb();
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
            const Text('Create a new dog'),
            TextField(
              controller: _idController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text("ID: ")),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(label: Text("Name: ")),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text("Age: ")),
            ),
            Spacer(),
            Expanded(
              child: ListView.builder(
                itemCount: dogs.length,
                itemBuilder: (_, index) {
                  return Text(dogs[index].toString());
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await DogDatabaseManager.instace.insertOrUpdateDog(
            Dog(
              id: int.parse(_idController.text),
              name: _nameController.text,
              age: int.parse(_ageController.text),
            ),
          );
          _updateDogs();
        },
        tooltip: 'Add Dog',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
