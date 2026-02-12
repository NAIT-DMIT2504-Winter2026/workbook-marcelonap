import 'package:files_example/storage/file_manager.dart';
import 'package:flutter/material.dart';

class FileScreen extends StatefulWidget {
  FileScreen({super.key, required this.fileName});
  String fileName;

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text(widget.fileName)));
  }
}
