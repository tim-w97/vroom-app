import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/rides/car_vm.dart';
import 'package:vroom_campus_app/widgets/closeable_alert.dart';

class CarUploadDummyScreen extends StatelessWidget {
  const CarUploadDummyScreen({super.key});

  Widget buildProgressIndicator({required String text}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CarVM>();
    final status = context.select<CarVM, Status>((vm) => vm.status);

    Widget buildCameraPreview() {
      if (status == Status.isInitializingCamera) {
        return buildProgressIndicator(text: 'Kamera wird initialisiert');
      }

      if (status == Status.isUploading) {
        return buildProgressIndicator(text: 'Bild wird hochgeladen');
      }

      return CameraPreview(vm.controller);
    }

    Future<void> uploadImage() async {
      try {
        await vm.uploadImage();
      } on String catch (error) {
        if (!context.mounted) {
          throw "Context isn't mounted";
        }

        showDialog(
          context: context,
          builder: (context) => CloseableAlert(
            title: 'Fehler',
            content: error,
          ),
        );
      }
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
