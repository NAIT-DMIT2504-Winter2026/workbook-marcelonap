import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String description;
  late bool isDone = false;

  late String? id;

  Todo({required this.description, this.isDone = false, this.id});

  factory Todo.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();

    return Todo(
      description: data['description'],
      isDone: data['isDone'],
      id: snapshot.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {'description': description, 'isDone': isDone};
  }
}
