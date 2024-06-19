import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CarVM extends ChangeNotifier {
  late CameraController controller;
  bool isLoading = true;

  CarVM() {
    _initCamera();
  }

  void _setIsLoading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  Future<void> _initCamera() async {
    _setIsLoading(true);

    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      throw 'This device has no cameras';
    }

    // use back camera if there are two cameras
    final camera = cameras.length > 1 ? cameras[1] : cameras[0];

    controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );

    await controller.initialize();

    _setIsLoading(false);
  }

  Future<void> uploadImage() async {
    _setIsLoading(true);

    final file = await controller.takePicture();

    print(file.name);

    _setIsLoading(false);
  }
}