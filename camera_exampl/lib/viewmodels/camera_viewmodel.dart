import 'package:camera/camera.dart';
import 'package:camera_exampl/models/camera_models.dart';
import 'package:camera_exampl/repositories/camera_repository.dart';
import 'package:riverpod/riverpod.dart';

class CameraViewmodel extends Notifier<CameraState> {
  @override
  CameraState build() {
    // TODO: implement build
    _subscribeToRepository();
    return CameraState.intial;
  }

  void _subscribeToRepository() {
    ref.listen(cameraRepositoryProvider.select((bucket) => bucket.photoPaths), (
      _,
      newPaths,
    ) {
      state = state.copyWith(photoPaths: newPaths);
    });

    ref.listen(cameraRepositoryProvider.select((bucket) => bucket.error), (
      _,
      newError,
    ) {
      state = state.copyWith(error: newError);
    });
  }

  void onCapture(XFile file) {
    ref.read(cameraRepositoryProvider.notifier).saveCapture(file);
  }
}

final cameraViewModelProvider = NotifierProvider<CameraViewmodel, CameraState>(
  CameraViewmodel.new,
);
