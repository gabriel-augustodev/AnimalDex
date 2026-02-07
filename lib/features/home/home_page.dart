import 'package:flutter/material.dart';
import '../scan/scan_page.dart';
import '../pokedex/pokedex_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimalDex')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Escanear Animal'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ScanPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Minha Pokédex'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PokedexPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
