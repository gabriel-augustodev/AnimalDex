import 'package:flutter/material.dart';
import '../../core/models/animal_model.dart';
import '../../core/storage/pokedex_storage.dart';

class PokedexController extends ChangeNotifier {
  final PokedexStorage _storage = PokedexStorage();

  List<AnimalModel> animals = [];

  Future<void> loadPokedex() async {
    animals = await _storage.getAnimals();
    notifyListeners();
  }

  Future<void> addAnimal(AnimalModel animal) async {
    final exists = animals.any((a) => a.id == animal.id);
    if (!exists) {
      animals.add(animal);
      await _storage.saveAnimals(animals);
      notifyListeners();
    }
  }

  int get discovered => animals.length;

  int totalAnimals = 150; // Pode ajustar depois
}
