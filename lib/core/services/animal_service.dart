import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../api/inaturalist_api.dart';
import '../models/animal_model.dart';

class AnimalService {
  /// 🔎 Busca por nome
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

  /// 🔎 Busca animal usando label retornado pelo ML Kit
  Future<AnimalModel?> searchAnimalByLabel(String label) async {
    final url = Uri.parse(
      "https://api.inaturalist.org/v1/taxa?q=$label&rank=species&order=desc&order_by=observations_count",
    );

    final response = await http.get(url);

    if (response.statusCode != 200) return null;

    final data = jsonDecode(response.body);

    final results = data["results"];

    if (results == null || results.isEmpty) return null;

    final normalizedLabel = label.toLowerCase();

    // 🔥 1️⃣ Tenta encontrar match exato no common_name
    final exactMatch = results.firstWhere(
      (item) =>
          item["preferred_common_name"] != null &&
          item["preferred_common_name"]
              .toString()
              .toLowerCase()
              .contains(normalizedLabel),
      orElse: () => null,
    );

    final chosen = exactMatch ?? results.first;

    return AnimalModel(
      id: chosen["id"],
      scientificName: chosen["name"] ?? "",
      commonName: chosen["preferred_common_name"] ?? "",
      imageUrl: chosen["default_photo"]?["medium_url"],
      wikipediaUrl: chosen["wikipedia_url"],
      rank: chosen["rank"] ?? "",
      observationsCount: chosen["observations_count"] ?? 0,
      iconicTaxon: chosen["iconic_taxon_name"] ?? "",
    );
  }

  /// 🧾 Lista de animais
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

  /// 📸 NOVO: Identificação por imagem (IA oficial do iNaturalist)
  Future<AnimalModel?> identifyAnimalByImage(File imageFile) async {
    final uri = Uri.parse(
      "https://api.inaturalist.org/v1/computervision/score_image",
    );

    final request = http.MultipartRequest('POST', uri);

    request.headers['Accept'] = 'application/json';

    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
      ),
    );

    request.fields['taxon_id'] = '1';
    request.fields['locale'] = 'en';

    final response = await request.send();

    final responseBody = await response.stream.bytesToString();

    print("STATUS CODE: ${response.statusCode}");
    print("BODY: $responseBody");

    if (response.statusCode != 200) {
      return null;
    }

    final data = json.decode(responseBody);

    if (data['results'] == null || data['results'].isEmpty) {
      return null;
    }

    final bestMatch = data['results'][0]['taxon'];

    return AnimalModel.fromJson(bestMatch);
  }
}
