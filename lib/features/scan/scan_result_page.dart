import 'package:flutter/material.dart';
import '../../core/services/animal_service.dart';
import '../../core/models/animal_model.dart';
import '../animal_detail/animal_detail_page.dart';

class ScanResultPage extends StatelessWidget {
  final String animalName;

  const ScanResultPage({super.key, required this.animalName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: FutureBuilder<AnimalModel?>(
        future: AnimalService().searchAnimalByName(animalName),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final animal = snapshot.data!;
          return ListTile(
            leading: Image.network(animal.imageUrl),
            title: Text(animal.commonName),
            subtitle: Text(animal.scientificName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AnimalDetailPage(animal: animal),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
