class INaturalistApi {
  static const baseUrl = "https://api.inaturalist.org/v1";

  static String searchByName(String name) {
    return "$baseUrl/taxa?q=$name&rank=species";
  }

  static String getAnimals({int page = 1}) {
    return "$baseUrl/taxa?rank=species&iconic_taxa=Animalia&page=$page&per_page=30";
  }
}
