import 'package:flutter/material.dart';

class CarUploadDummyScreen extends StatelessWidget {
  const CarUploadDummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void uploadImage() {
      print('Uploading image to server ...');
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: uploadImage,
        child: const Icon(Icons.camera_alt),
      ),
      appBar: AppBar(
        title: const Text('Bildupload-Test'),
      ),
      body: const Center(
        child: Text('Lade ein Bild hoch'),
      ),
    );
  }
}
