import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/home/home_page.dart';
import 'features/scan/scan_controller.dart';
import 'features/pokedex/pokedex_controller.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const AnimalDexApp());
}

class AnimalDexApp extends StatelessWidget {
  const AnimalDexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScanController()),
        ChangeNotifierProvider(
            create: (_) => PokedexController()..loadPokedex()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AnimalDex',
        theme: AppTheme.lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
