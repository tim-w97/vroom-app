import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CarVM extends ChangeNotifier {
  CameraController? controller;

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      throw 'This device has no cameras';
    }

    // use back camera if there are two cameras
    final camera = cameras.length > 1 ? cameras[1] : cameras[0];

    final controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );

    await controller.initialize();

    this.controller = controller;
    notifyListeners();
  }

  Future<void> uploadImage() async {

  }
}