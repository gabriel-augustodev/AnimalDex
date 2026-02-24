import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/animal_name_mapper.dart';
import '../../core/data/pokedex_base.dart';
import '../../core/models/pokedex_entry.dart';
import '../../core/models/animal_model.dart';

class PokedexController extends ChangeNotifier {
  List<PokedexEntry> _entries = PokedexBase.initialEntries();

  List<PokedexEntry> get entries => _entries;

  // 🔥 ADICIONE AQUI
  String normalize(String text) {
    return text.toLowerCase().trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  void unlockAnimal(AnimalModel scannedAnimal) {
    final englishName = normalize(scannedAnimal.commonName);

    debugPrint("API retornou: $englishName");

    String? portugueseName = AnimalNameMapper.englishToPortuguese[englishName];

    // 🔥 tentativa flexível
    portugueseName ??= AnimalNameMapper.englishToPortuguese.entries
        .firstWhere(
          (entry) => englishName.contains(entry.key),
          orElse: () => const MapEntry("", ""),
        )
        .value;

    if (portugueseName.isEmpty) {
      debugPrint("❌ Não encontrado no Map: $englishName");
      return;
    }

    final index = _entries.indexWhere(
      (entry) => entry.animal.commonName == portugueseName,
    );

    if (index == -1) {
      debugPrint("❌ Slot não encontrado na Pokédex: $portugueseName");
      return;
    }

    final updatedAnimal = AnimalModel(
      id: scannedAnimal.id,
      scientificName: scannedAnimal.scientificName,
      commonName: portugueseName,
      imageUrl: scannedAnimal.imageUrl,
      wikipediaUrl: scannedAnimal.wikipediaUrl,
      rank: scannedAnimal.rank,
      observationsCount: scannedAnimal.observationsCount,
      iconicTaxon: scannedAnimal.iconicTaxon,
    );

    _entries[index] = PokedexEntry(
      pokedexNumber: _entries[index].pokedexNumber,
      rarity: _entries[index].rarity,
      isDiscovered: true,
      animal: updatedAnimal,
    );

    notifyListeners();
  }
}
