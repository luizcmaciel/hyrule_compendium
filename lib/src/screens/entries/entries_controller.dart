import 'package:bloc/bloc.dart';

import '../../core/fp/either.dart';
import '../../repositories/entry/entry_repository.dart';
import 'entries_state.dart';

class EntriesController extends Cubit<EntriesState> {
  final EntryRepository _entryRepository;

  EntriesController(
    this._entryRepository,
  ) : super(EntriesInitialState());

  Future<void> getEntriesByCategory(String category) async {
    emit(EntriesLoadingState());
    final result = await _entryRepository.getEntriesByCategory(category);
    return switch (result) {
      Success(:final value) => emit(EntriesLoadedState(entries: value)),
      Failure(:final exception) => emit(EntriesErrorState(message: exception.message)),
    };
  }
}
