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
      final controller = vm.controller;

      if (controller == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return CameraPreview(controller);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: vm.uploadImage,
        child: const Icon(Icons.camera_alt),
      ),
      appBar: AppBar(
        title: const Text('Bildupload-Test'),
      ),
      body: buildCameraPreview(),
    );
  }
}
