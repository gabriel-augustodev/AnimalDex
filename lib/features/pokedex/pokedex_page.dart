import 'package:flutter/material.dart';
import '../../core/storage/pokedex_storage.dart';
import '../widgets/animal_card.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minha Pokédex')),
      body: FutureBuilder(
        future: PokedexStorage().getAnimals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final animals = snapshot.data ?? [];

          if (animals.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum animal capturado ainda 🐾',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: animals.length,
            itemBuilder: (context, i) {
              return AnimalCard(animal: animals[i]);
            },
          );
        },
      ),
    );
  }
}
