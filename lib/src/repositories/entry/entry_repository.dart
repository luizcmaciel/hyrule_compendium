import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../models/entry_model.dart';

abstract interface class EntryRepository {
  Future<Either<RepositoryException, List<EntryModel>>> getEntriesByCategory(
    String category,
  );
}
