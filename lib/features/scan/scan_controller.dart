import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:provider/provider.dart';
import '../../core/models/animal_model.dart';
import '../../core/services/animal_service.dart';
import '../pokedex/pokedex_controller.dart';

class ScanController extends ChangeNotifier {
  final AnimalService _service = AnimalService();

  bool isLoading = false;
  String? error;

  Future<void> scanAnimal(
    BuildContext context,
    File imageFile,
  ) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      // 🔎 1️⃣ Processa imagem com ML Kit
      final inputImage = InputImage.fromFile(imageFile);

      final imageLabeler = ImageLabeler(
        options: ImageLabelerOptions(
          confidenceThreshold: 0.7,
        ),
      );

      final labels = await imageLabeler.processImage(inputImage);

      await imageLabeler.close();

      if (labels.isEmpty) {
        error = "Nenhum animal detectado";
        return;
      }

      final topLabel = labels.first.label.toLowerCase();

      debugPrint("ML KIT DETECTOU: $topLabel");

      // 🌍 2️⃣ Consulta API usando o label detectado
      final animal = await _service.searchAnimalByLabel(topLabel);

      if (!context.mounted) return;

      if (animal == null) {
        error = "Animal não encontrado na base científica";
        debugPrint("❌ API não retornou resultado válido");
        return;
      }

      debugPrint("API retornou: ${animal.commonName.toLowerCase()}");

      // 🎮 3️⃣ Envia para PokédexController
      context.read<PokedexController>().unlockAnimal(animal);
    } catch (e) {
      error = "Erro ao escanear animal";
      debugPrint("ERRO: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
