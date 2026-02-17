import 'animal_model.dart';

class PokedexEntry {
  final int pokedexNumber; // 001, 002...
  final AnimalModel animal;
  final bool isDiscovered;
  final String rarity; // comum, incomum, raro, lendario

  PokedexEntry({
    required this.pokedexNumber,
    required this.animal,
    required this.isDiscovered,
    required this.rarity,
  });

  PokedexEntry copyWith({
    bool? isDiscovered,
  }) {
    return PokedexEntry(
      pokedexNumber: pokedexNumber,
      animal: animal,
      rarity: rarity,
      isDiscovered: isDiscovered ?? this.isDiscovered,
    );
  }
}
