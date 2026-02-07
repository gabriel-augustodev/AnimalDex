import 'package:flutter/material.dart';
import '../../core/models/animal_model.dart';
import '../../core/services/animal_service.dart';

class ScanController extends ChangeNotifier {
  final AnimalService _service = AnimalService();

  AnimalModel? animal;
  bool isLoading = false;
  String? error;

  Future<void> scanAnimal(String query) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      animal = await _service.searchAnimalByName(query);

      if (animal == null) {
        error = 'Animal não encontrado';
      }
    } catch (e) {
      error = 'Erro ao identificar animal';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    animal = null;
    error = null;
    notifyListeners();
  }
}
