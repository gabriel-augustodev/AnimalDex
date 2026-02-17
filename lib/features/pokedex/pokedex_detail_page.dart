import 'package:flutter/material.dart';
import '../../core/models/pokedex_entry.dart';

class PokedexDetailPage extends StatelessWidget {
  final PokedexEntry entry;

  const PokedexDetailPage({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "#${entry.pokedexNumber.toString().padLeft(3, '0')}",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: entry.isDiscovered
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(entry.animal.imageUrl),
                  const SizedBox(height: 16),
                  Text(
                    entry.animal.commonName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(entry.animal.scientificName),
                  Text("Taxon: ${entry.animal.iconicTaxon}"),
                  Text("Rank: ${entry.animal.rank}"),
                ],
              )
            : const Center(
                child: Text(
                  "Animal não escaneado",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
    );
  }
}
