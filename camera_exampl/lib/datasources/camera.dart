import 'dart:io';

import 'package:camera/camera.dart';

import 'package:riverpod/riverpod.dart';
import 'package:path_provider/path_provider.dart';

class CameraDataSource {
  Future<List<CameraDescription>> getAvaibleCameras() async {
    return await availableCameras();
  }

  CameraController createController(CameraDescription camera) {
    return CameraController(camera, ResolutionPreset.high);
  }

  Future<void> initalizeController(CameraController controller) async {
    await controller.initialize();
  }

  //Storing and fetching photo paths
  Future<Directory> _photosDir() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dir = Directory("${appDir.path}/camera_photos");
    if (!await dir.exists()) await dir.create();
    return dir;
  }

  Future<String> savePhoto(XFile file) async {
    final dir = await _photosDir();
    final fileName = 'photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final savedPhoto = await File(file.path).copy("${dir.path}/$fileName");
    return savedPhoto.path;
  }

  Future<List<String>> getSavedPhotos() async {
    final dir = await _photosDir();
    final files = dir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith(".jpg"))
        .map((f) => f.path)
        .toList();
    files.sort((a, b) => b.compareTo(a));
    return files;
  }
}

final cameraDataSourceProvider = Provider<CameraDataSource>(
  (ref) => CameraDataSource(),
);
