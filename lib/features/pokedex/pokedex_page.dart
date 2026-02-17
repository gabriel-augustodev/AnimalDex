import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/pokedex/pokedex_controller.dart';
import 'package:flutter_application_1/features/pokedex/pokedex_detail_page.dart';
import 'package:provider/provider.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PokedexController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokédex"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: controller.entries.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final entry = controller.entries[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PokedexDetailPage(entry: entry),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: entry.isDiscovered ? Colors.white : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: entry.isDiscovered
                    ? Image.network(
                        entry.animal.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Text(
                        "#${entry.pokedexNumber.toString().padLeft(3, '0')}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
