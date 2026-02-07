class AnimalModel {
  final int id;
  final String scientificName;
  final String commonName;
  final String imageUrl;
  final String wikipediaUrl;
  final String rank;
  final int observationsCount;
  final String iconicTaxon;

  AnimalModel({
    required this.id,
    required this.scientificName,
    required this.commonName,
    required this.imageUrl,
    required this.wikipediaUrl,
    required this.rank,
    required this.observationsCount,
    required this.iconicTaxon,
  });

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
      id: json['id'],
      scientificName: json['name'] ?? 'Nome científico desconhecido',
      commonName: json['matched_term'] ??
          json['preferred_common_name'] ??
          'Nome popular desconhecido',
      imageUrl: json['default_photo'] != null
          ? json['default_photo']['medium_url']
          : '',
      wikipediaUrl: json['wikipedia_url'] ?? '',
      rank: json['rank'] ?? '',
      observationsCount: json['observations_count'] ?? 0,
      iconicTaxon: json['iconic_taxon_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': scientificName,
      'matched_term': commonName,
      'rank': rank,
      'observations_count': observationsCount,
      'iconic_taxon_name': iconicTaxon,
      'wikipedia_url': wikipediaUrl,
      'default_photo': {
        'medium_url': imageUrl,
      },
    };
  }
}
