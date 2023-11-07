import '../../models/entry_model.dart';

sealed class EntriesState {}

class EntriesInitialState extends EntriesState {}

class EntriesLoadingState extends EntriesState {}

class EntriesLoadedState extends EntriesState {
  final List<EntryModel> entries;

  EntriesLoadedState({required this.entries});
}

class EntriesErrorState extends EntriesState {
  final String message;

  EntriesErrorState({required this.message});
}
