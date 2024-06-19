import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

    // TODO: move the following to the "NetworkClerk", ask Nik for help :P

    final apiUrl = dotenv.env['API_URL'];

    if (apiUrl == null) {
      throw 'Api URL is null, do you added it to .env?';
    }

    final carImageUrl = Uri.parse('$apiUrl/cars/image');

    // TODO: use Base64 encoded credentials from shared preferences
    const username = 'tim@test.de';
    const password = 'tim123';

    final base64EncodedCredentials = base64UrlEncode(
      utf8.encode('$username:$password'),
    );

    String basicAuthHeader = 'Basic $base64EncodedCredentials';

    Map<String, String> headers = { "Authorization": basicAuthHeader};

    final request = http.MultipartRequest('POST', carImageUrl);
    request.headers.addAll(headers);

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