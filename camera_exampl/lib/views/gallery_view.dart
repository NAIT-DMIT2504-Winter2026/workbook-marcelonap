import 'dart:io';

import 'package:camera_exampl/viewmodels/camera_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GalleryView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final state = ref.watch(cameraViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Gallery")),
      body: state.photoPaths.isEmpty
          ? const Center(child: Text("No photos yet"))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: state.photoPaths.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print("${state.photoPaths[index]} was tapped");
                    Navigator.pushNamed(
                      context,
                      "/fullscreen-view",
                      arguments: [state.photoPaths[index]],
                    );
                  },
                  child: Image.file(
                    File(state.photoPaths[index]),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
    );
  }
}

class FullScreenPicture extends StatelessWidget {
  FullScreenPicture({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(path)),
      body: Image.file(File(path), fit: BoxFit.fill),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //         Navigator.of(context).pop();
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
