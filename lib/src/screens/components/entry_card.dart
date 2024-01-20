import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../models/entry_model.dart';
import '../entry_details/entry_details_screen.dart';

class EntryCard extends StatelessWidget {
  final EntryModel entry;

  const EntryCard({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);

    return OpenContainer(
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (context, action) => Card(
        child: InkWell(
          onTap: action,
          child: Ink(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  clipBehavior: Clip.hardEdge,
                  width: 138,
                  height: 208,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: NetworkImage(entry.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.name.toUpperCase(),
                        style: textTheme.titleLarge,
                      ),
                      Text(
                        entry.description,
                        style: textTheme.bodySmall,
                        maxLines: 8,
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      openBuilder: (context, action) => EntryDetailsScreen(entry: entry),
    );
  }
}
