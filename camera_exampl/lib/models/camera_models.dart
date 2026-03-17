class CameraBucket {
  final List<String> photoPaths;
  final String? error;

  const CameraBucket({this.photoPaths = const [], this.error});

  static const intial = CameraBucket();

  CameraBucket copyWith({List<String>? photoPaths, String? error}) {
    return CameraBucket(
      photoPaths: photoPaths ?? this.photoPaths,
      error: error ?? this.error,
    );
  }
}

class CameraState {
  final List<String> photoPaths;
  final String? error;

  const CameraState({this.photoPaths = const [], this.error});

  static const intial = CameraState();

  CameraState copyWith({List<String>? photoPaths, String? error}) {
    return CameraState(
      photoPaths: photoPaths ?? this.photoPaths,
      error: error ?? this.error,
    );
  }
}
