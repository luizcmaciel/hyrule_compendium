import 'package:flutter/material.dart';

import '../../models/categories.dart';
import '../entries/entries_screen.dart';

class CategoryCard extends StatelessWidget {
  final Categories category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: colorScheme.inversePrimary),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EntriesScreen(
                category: category,
              ),
            ),
          );
        },
        child: Ink(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/${category.name}.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Text(
                category.label.toUpperCase(),
                style: textTheme.titleSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
