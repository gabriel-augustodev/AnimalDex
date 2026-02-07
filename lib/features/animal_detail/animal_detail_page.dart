import 'package:flutter/material.dart';
import '../../core/models/animal_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimalDetailPage extends StatelessWidget {
  final AnimalModel animal;

  const AnimalDetailPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(animal.commonName)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (animal.imageUrl.isNotEmpty)
              Image.network(animal.imageUrl, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.commonName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    animal.scientificName,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('Grupo: ${animal.iconicTaxon}'),
                  Text('Observações: ${animal.observationsCount}'),
                  Text('Rank: ${animal.rank}'),
                  const SizedBox(height: 16),
                  if (animal.wikipediaUrl.isNotEmpty)
                    InkWell(
                      onTap: () async {
                        final uri = Uri.parse(animal.wikipediaUrl);
                        if (await canLaunchUrl(uri)) {
                          launchUrl(uri);
                        }
                      },
                      child: const Text(
                        'Ver na Wikipedia',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
