import 'package:flutter/material.dart';

import 'core/themes/theme.dart';
import 'screens/categories/categories_screen.dart';

class HyruleCompendiumApp extends StatelessWidget {
  const HyruleCompendiumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hyrule Compendium',
      theme: ThemeConfig.defaultTheme,
      home: const CategoriesScreen(),
    );
  }
}
