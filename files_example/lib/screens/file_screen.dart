import 'package:files_example/storage/file_manager.dart';
import 'package:flutter/material.dart';

class FileScreen extends StatefulWidget {
  FileScreen({super.key, required this.fileName, required this.fileManager});
  String fileName;
  FileManager fileManager;

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  List<String> fileLines = [];
  final _textController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Initialize fileLines from actual file
    _updateFileLines();
  }

  void _updateFileLines() {
    widget.fileManager.readFileLinesFromName(widget.fileName).then((lines) {
      setState(() {
        fileLines = lines;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.fileName)),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(label: Text("Write to the file")),
            ),
            TextButton(
              child: Text("Add"),
              onPressed: () {
                widget.fileManager.writeToFileFromFileName(
                  widget.fileName,
                  "${_textController.text} \n",
                );
                _textController.clear();
                _updateFileLines();
              },
            ),
            Spacer(),
            Expanded(
              child: ListView.builder(
                itemCount: fileLines.length,
                itemBuilder: (context, index) {
                  return Text(fileLines[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
