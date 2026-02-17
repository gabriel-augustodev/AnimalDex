import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api/inaturalist_api.dart';
import '../models/animal_model.dart';

class AnimalService {
  /// 🔎 Busca por nome (já existente)
  Future<AnimalModel?> searchAnimalByName(String name) async {
    final url = Uri.parse(INaturalistApi.searchByName(name));

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      if (results.isNotEmpty) {
        return AnimalModel.fromJson(results.first);
      }
    }
    return null;
  }

  /// 🧾 NOVO: Busca lista de animais (para Pokédex)
  Future<List<AnimalModel>> fetchAnimals({int page = 1}) async {
    final url = Uri.parse(
      INaturalistApi.getAnimals(page: page),
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      return results.map((json) => AnimalModel.fromJson(json)).toList();
    }

    return [];
  }
}
