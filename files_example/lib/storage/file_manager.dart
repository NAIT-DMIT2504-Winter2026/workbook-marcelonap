import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileManager {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> createFile(String name) async {
    try {
      final file = await getFile(name);
      writeToFile(file, " ");
    } catch (e) {
      print(
        "@FileManager.writeToFile -- Something went wrong creating file: $e",
      );
    }
  }

  Future<File> getFile(String name) async {
    final path = await _localPath;
    return File("$path/$name");
  }

  Future<bool> writeToFile(File file, String content) async {
    try {
      await file.writeAsString(content, flush: true);
      return true;
    } catch (e) {
      print(
        "@FileManager.writeToFile -- Something went wrong writing to file: $e",
      );
      return false;
    }
  }

  Future<bool> writeToFileFromFileName(String fileName, String content) async {
    final file = await getFile(fileName);
    return writeToFile(file, content);
  }

  Future<List<String>> readFileLines(File file) async {
    try {
      final lines = await file.readAsLines();
      return lines;
    } catch (e) {
      print(
        "@FileManager.writeToFile -- Something went wrong reading to file: $e",
      );
      return [];
    }
  }

  Future<List<String>> readFileLinesFromName(String fileName) async {
    final file = await getFile(fileName);
    return readFileLines(file);
  }

  Future<List<String>> listAppDirectory() async {
    final dir = Directory(await _localPath);
    final files = dir.listSync(recursive: true, followLinks: false);
    print(files);
    final list = files.map((e) => e.path).toList();
    List<String> returnList = [];
    list.forEach((e) async {
      returnList.add(await getFileName(e));
    });
    return returnList;
  }

  Future<String> getFileName(String fullPath) async {
    String name = '';
    name = fullPath.replaceFirst(await _localPath, "");
    return name;
  }
}
