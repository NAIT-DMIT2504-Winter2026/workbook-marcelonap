import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_exampl/datasources/camera.dart';
import 'package:camera_exampl/viewmodels/camera_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraView extends ConsumerStatefulWidget {
  const CameraView({super.key});

  @override
  ConsumerState<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends ConsumerState<CameraView> {
  CameraController? _controller;
  bool _isInitialized = false;
  String? _initError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final dataSource = ref.read(cameraDataSourceProvider);
      final cameras = await dataSource.getAvaibleCameras();
      if (cameras.isEmpty) {
        if (!mounted) return;
        setState(() {
          _initError = "No cameras available on this device";
        });
        return;
      }
      final controller = dataSource.createController(cameras.first);
      await dataSource.initalizeController(controller);
      if (!mounted) return;
      setState(() {
        _controller = controller;
        _isInitialized = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _initError = e.toString();
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Camera")),
      body: _initError != null
          ? Center(child: Text(_initError!))
          : _isInitialized && _controller != null
          ? CameraPreview(_controller!)
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //Use the controlelr to take a picture and save it to a known location
          if (_controller == null) {
            setState(() {
              _initError = "Controller null when taking picture";
            });
          }

          final file = await _controller!.takePicture();
          ref.read(cameraViewModelProvider.notifier).onCapture(file);
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              const SnackBar(
                content: Text("Photo Saved"),
                duration: Duration(seconds: 1),
              ),
            );
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
