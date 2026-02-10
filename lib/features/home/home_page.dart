import 'package:flutter/material.dart';
import '../scan/scan_page.dart';
import '../pokedex/pokedex_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimalDex'),
      ),
      body: const SizedBox.expand(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// 🔍 Escanear
            _HomeActionButton(
              icon: Icons.qr_code_scanner,
              label: 'Escanear',
              color: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ScanPage()),
                );
              },
            ),

            /// 📘 Pokédex
            _HomeActionButton(
              icon: Icons.collections_bookmark,
              label: 'Pokédex',
              color: theme.colorScheme.primary,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PokedexPage()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

/// 🔹 Botão customizado seguindo o tema
class _HomeActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _HomeActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(14),
          color: color,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: onTap,
            child: SizedBox(
              width: 56,
              height: 56,
              child: Icon(
                icon,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
