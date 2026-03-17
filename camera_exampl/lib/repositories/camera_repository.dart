import 'package:camera/camera.dart';
import 'package:camera_exampl/datasources/camera.dart';
import 'package:camera_exampl/models/camera_models.dart';
import 'package:riverpod/riverpod.dart';

class CameraRepository extends Notifier<CameraBucket> {
  @override
  CameraBucket build() {
    // TODO: implement build
    _loadsSavedPhotos();
    return CameraBucket.intial;
  }

  Future<void> _loadsSavedPhotos() async {
    try {
      final paths = await ref.read(cameraDataSourceProvider).getSavedPhotos();
      state = state.copyWith(photoPaths: paths);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> saveCapture(XFile file) async {
    try {
      final savedPath = await ref
          .read(cameraDataSourceProvider)
          .savePhoto(file);
      _loadsSavedPhotos();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

final cameraRepositoryProvider =
    NotifierProvider<CameraRepository, CameraBucket>(CameraRepository.new);
