import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/scan/scan_controller.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ScanController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear Animal"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (controller.isLoading) const CircularProgressIndicator(),
            if (controller.error != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  controller.error!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final picker = ImagePicker();

                final pickedImage = await picker.pickImage(
                  source: ImageSource.gallery,
                );

                if (pickedImage == null) return;

                controller.scanAnimal(
                  context,
                  File(pickedImage.path),
                );
              },
              child: const Text("Selecionar da Galeria"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final picker = ImagePicker();

                final pickedImage = await picker.pickImage(
                  source: ImageSource.camera,
                );

                if (pickedImage == null) return;

                controller.scanAnimal(
                  context,
                  File(pickedImage.path),
                );
              },
              child: const Text("Tirar Foto"),
            ),
          ],
        ),
      ),
    );
  }
}
