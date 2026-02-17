import '../models/animal_model.dart';
import '../models/pokedex_entry.dart';

class PokedexBase {
  static List<PokedexEntry> initialEntries() {
    return List.generate(20, (index) {
      return PokedexEntry(
        pokedexNumber: index + 1,
        rarity: "comum",
        isDiscovered: false,
        animal: AnimalModel(
          id: 0,
          scientificName: "Desconhecido",
          commonName: "Animal ${index + 1}",
          imageUrl: "",
          wikipediaUrl: "",
          rank: "",
          observationsCount: 0,
          iconicTaxon: "",
        ),
      );
    });
  }
}
