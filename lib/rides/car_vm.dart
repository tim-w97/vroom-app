import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

enum Status {
  idle,
  isInitializingCamera,
  isUploading,
  error,
  success,
}

class CarVM extends ChangeNotifier {
  var status = Status.idle;
  String? error;

  late CameraController controller;

  CarVM() {
    _initCamera();
  }

  void setStatusAndNotify(Status status) {
    this.status = status;
    notifyListeners();
  }

  Future<void> _initCamera() async {
    setStatusAndNotify(Status.isInitializingCamera);

    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      setStatusAndNotify(Status.error);
      throw 'This device has no cameras';
    }

    // use back camera if there are two cameras
    final camera = cameras.length > 1 ? cameras[1] : cameras[0];

    controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );

    await controller.initialize();
    setStatusAndNotify(Status.idle);
  }

  Future<void> uploadImage() async {
    setStatusAndNotify(Status.isUploading);

    final imageFile = await controller.takePicture();

    // TODO: move the following to the "NetworkClerk", ask Nik for help :P

    final apiUrl = dotenv.env['API_URL'];

    if (apiUrl == null) {
      setStatusAndNotify(Status.error);
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

    Map<String, String> headers = {"Authorization": basicAuthHeader};

    final request = http.MultipartRequest('POST', carImageUrl);
    request.headers.addAll(headers);

    final multipartFile = await http.MultipartFile.fromPath(
      'imageFile',
      imageFile.path,
    );

    request.files.add(multipartFile);

    http.StreamedResponse? response;

    try {
      response = await request.send();
    } on SocketException catch (exception) {
      log(exception.message);
      throw 'Backend ist nicht aktiv';
    } catch (exception) {
      log(exception.toString());
      throw 'Unbekannter Fehler';
    } finally {
      setStatusAndNotify(Status.error);
    }

    if (response.statusCode != 201) {
      setStatusAndNotify(Status.error);
      throw 'Server hat mit Status-Code ${response.statusCode} geantwortet';
    }

    setStatusAndNotify(Status.success);
  }
}
