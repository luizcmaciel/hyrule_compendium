import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/http/rest_client.dart';
import '../../models/entry_model.dart';
import '../../repositories/entry/entry_repository_impl.dart';
import '../components/entry_card.dart';
import '../components/loading_widget.dart';
import 'entries_controller.dart';
import 'entries_state.dart';

class EntriesScreen extends StatefulWidget {
  final String category;

  const EntriesScreen({
    super.key,
    required this.category,
  });

  @override
  State<EntriesScreen> createState() => _EntriesScreenState();
}

class _EntriesScreenState extends State<EntriesScreen> {
  final controller = EntriesController(EntryRepositoryImp(RestClient()));

  @override
  void initState() {
    controller.getEntriesByCategory(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.toUpperCase()),
      ),
      body: BlocBuilder<EntriesController, EntriesState>(
        bloc: controller,
        builder: (context, state) {
          return switch (state) {
            EntriesInitialState() => const SizedBox.shrink(),
            EntriesLoadingState() => const LoadingState(),
            EntriesLoadedState(:final entries) => LoadedState(entries: entries),
            EntriesErrorState(:final message) => ErrorState(message: message),
          };
        },
      ),
    );
  }
}

class LoadedState extends StatelessWidget {
  final List<EntryModel> entries;

  const LoadedState({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: entries.length,
      itemBuilder: (context, index) => EntryCard(entry: entries[index]),
    );
  }
}

class ErrorState extends StatelessWidget {
  final String message;

  const ErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);
    return Center(
      child: Text(
        message,
        style: textTheme.titleLarge,
      ),
    );
  }
}
