import 'package:flutter/material.dart';
import 'scan_result_page.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escanear')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Simular Scan'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ScanResultPage(animalName: 'onça'),
              ),
            );
          },
        ),
      ),
    );
  }
}
