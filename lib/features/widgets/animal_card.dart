import 'package:flutter/material.dart';
import '../../core/models/animal_model.dart';
import '../animal_detail/animal_detail_page.dart';

class AnimalCard extends StatelessWidget {
  final AnimalModel animal;

  const AnimalCard({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        leading: animal.imageUrl.isNotEmpty
            ? Image.network(
                animal.imageUrl,
                width: 60,
                fit: BoxFit.cover,
              )
            : const Icon(Icons.pets),
        title: Text(
          animal.commonName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          animal.scientificName,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        onTap: () {
          /// 👉 É AQUI que entra o Navigator.push
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AnimalDetailPage(animal: animal),
            ),
          );
        },
      ),
    );
  }
}
