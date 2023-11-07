import 'package:flutter/material.dart';

import '../../models/entry_model.dart';

class EntryDetailsScreen extends StatefulWidget {
  final EntryModel entry;

  const EntryDetailsScreen({
    super.key,
    required this.entry,
  });

  @override
  State<EntryDetailsScreen> createState() => _EntryDetailsScreenState();
}

class _EntryDetailsScreenState extends State<EntryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry.name.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .4,
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: NetworkImage(widget.entry.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              widget.entry.name.toUpperCase(),
              style: textTheme.titleLarge,
            ),
            Text(
              widget.entry.description,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
