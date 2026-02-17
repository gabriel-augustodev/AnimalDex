import 'package:flutter/material.dart';
import '../../core/data/pokedex_base.dart';
import '../../core/models/pokedex_entry.dart';
import '../../core/models/animal_model.dart';

class PokedexController extends ChangeNotifier {
  late List<PokedexEntry> _entries;

  List<PokedexEntry> get entries => _entries;

  PokedexController() {
    _entries = PokedexBase.initialEntries();
  }

  void unlockAnimal(AnimalModel scannedAnimal) {
    final index = _entries.indexWhere(
      (entry) =>
          entry.animal.commonName.toLowerCase() ==
          scannedAnimal.commonName.toLowerCase(),
    );

    if (index != -1) {
      _entries[index] = PokedexEntry(
        pokedexNumber: _entries[index].pokedexNumber,
        rarity: _entries[index].rarity,
        isDiscovered: true,
        animal: scannedAnimal,
      );

      notifyListeners();
    }
  }
}
