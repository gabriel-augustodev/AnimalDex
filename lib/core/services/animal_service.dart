import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api/inaturalist_api.dart';
import '../models/animal_model.dart';

class AnimalService {
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
}
