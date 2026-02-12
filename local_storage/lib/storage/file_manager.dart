import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileManager {
  Future<String> defaultPath() async =>
      getApplicationDocumentsDirectory().then((dir) => dir.path);

  Future<File> getFile(String filename) async {
    final path = await defaultPath();
    return File("$path/$filename");
  }

  Future<void> writeFile(String filename, String content) async {
    final file = await getFile(filename);
    await file.writeAsString(content);
  }

  Future<String> readFile(String filename) async {
    try {
      final file = await getFile(filename);
      return await file.readAsString();
    } catch (e) {
      return "Something went wrong when reading the file";
    }
  }

  Future<List<String>> listFiles() async {
    final path = await defaultPath();
    final dir = Directory(path);
    final List<FileSystemEntity> entities = await dir.list().toList();
    return entities.map((e) => e.path).toList();
  }
}
