class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({required this.id, required this.name, required this.age});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }

  factory Dog.fromMap(Map<String, Object?> dogMap) {
    return Dog(
      id: dogMap['id'] as int,
      name: dogMap['name'] as String,
      age: dogMap['age'] as int,
    );
  }
  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
