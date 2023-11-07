import 'package:flutter/material.dart';

import '../components/category_card.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'.toUpperCase()),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        children: Categories.values
            .map((e) => CategoryCard(category: e.name))
            .toList(),
      ),
    );
  }
}

enum Categories {
  creatures,
  equipment,
  materials,
  monsters,
  treasure,
}
