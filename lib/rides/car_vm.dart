import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

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

  Future<bool> uploadImage() async {
    _setIsLoading(true);

    final imageFile = await controller.takePicture();

    // TODO: move the following to the "NetworkClerk"

    final apiUrl = dotenv.env['API_URL'];

    if (apiUrl == null) {
      throw 'Api URL is null, do you added it to .env?';
    }

    final carImageUrl = Uri.parse('$apiUrl/cars/image');

    final request = http.MultipartRequest('POST', carImageUrl);

    final multipartFile = await http.MultipartFile.fromPath(
      'imageFile',
      imageFile.path,
    );

    request.files.add(multipartFile);

    final response = await request.send();

    _setIsLoading(false);
    return response.statusCode == 200;
  }
}