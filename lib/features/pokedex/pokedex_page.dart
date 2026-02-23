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
                border: Border.all(
                  color: _rarityColor(entry.rarity),
                  width: 3,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (entry.isDiscovered && entry.animal.imageUrl.isNotEmpty)
                      Expanded(
                        child: Image.network(
                          entry.animal.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      )
                    else
                      Text(
                        "#${entry.pokedexNumber.toString().padLeft(3, '0')}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const SizedBox(height: 6),
                    Text(
                      entry.animal.commonName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: entry.isDiscovered
                            ? Colors.black
                            : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _rarityColor(String rarity) {
    switch (rarity) {
      case "comum":
        return Colors.green;
      case "incomum":
        return Colors.blue;
      case "raro":
        return Colors.purple;
      case "lendario":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
