import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/rides/car_vm.dart';

class CarUploadDummyScreen extends StatelessWidget {
  const CarUploadDummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CarVM>();

    Widget buildCameraPreview() {
      if (vm.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return CameraPreview(vm.controller);
    }

    Future<void> uploadImage() async {
      String message = 'Hochladen fehlgeschlagen';

      final uploadSuccessful = await vm.uploadImage();

      if (uploadSuccessful) {
        message = 'Bild wurde erfolgreich hochgeladen';
      }

      if (!context.mounted) {
        throw "Context isn't mounted, can't show dialog";
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(message),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: uploadImage,
        child: const Icon(Icons.camera_alt),
      ),
      appBar: AppBar(
        title: const Text('Bildupload-Test'),
      ),
      body: buildCameraPreview(),
    );
  }
}
