import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/animal_model.dart';

class PokedexStorage {
  static const String _key = 'pokedex_animals';

  /// 🔹 Salva lista de animais
  Future<void> saveAnimals(List<AnimalModel> animals) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonList = animals.map((animal) => animal.toJson()).toList();

    await prefs.setString(_key, jsonEncode(jsonList));
  }

  /// 🔹 Recupera lista de animais
  Future<List<AnimalModel>> getAnimals() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);

    if (jsonString == null) return [];

    final List decoded = jsonDecode(jsonString);

    return decoded.map((e) => AnimalModel.fromJson(e)).toList();
  }

  /// 🔹 Limpar Pokédex (opcional, debug)
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
