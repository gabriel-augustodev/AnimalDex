import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String _result = "";

  Future<void> _pickImage(ImageSource source) async {
    final picked = await _picker.pickImage(source: source);

    if (picked == null) return;

    final file = File(picked.path);

    setState(() {
      _image = file;
    });

    await _analyzeImage(file);
  }

  Future<void> _analyzeImage(File file) async {
    final inputImage = InputImage.fromFile(file);
    final labeler = ImageLabeler(options: ImageLabelerOptions());

    final labels = await labeler.processImage(inputImage);

    if (labels.isNotEmpty) {
      setState(() {
        _result = labels.first.label;
      });
    } else {
      setState(() {
        _result = "Nenhum animal detectado";
      });
    }

    labeler.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (_image != null)
              Expanded(
                child: Image.file(_image!),
              ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Text(
                "Detectado: $_result",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: const Text("Usar Câmera"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: const Text("Escolher da Galeria"),
            ),
          ],
        ),
      ),
    );
  }
}
