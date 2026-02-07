class INaturalistApi {
  static const String baseUrl = 'https://api.inaturalist.org/v1/taxa';

  static String searchByName(String name) {
    return '$baseUrl?q=$name&per_page=1';
  }
}
