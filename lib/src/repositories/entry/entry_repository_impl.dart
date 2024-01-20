import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../core/http/rest_client.dart';
import '../../models/entry_model.dart';
import 'entry_repository.dart';

class EntryRepositoryImp implements EntryRepository {
  final RestClient _dio;

  const EntryRepositoryImp(this._dio);

  @override
  Future<Either<RepositoryException, List<EntryModel>>> getEntriesByCategory(
    String category,
  ) async {
    try {
      final Response(:data) = await _dio.get('/$category');
      final entries =
          List<EntryModel>.from(data['data'].map((e) => EntryModel.fromMap(e)));
      return Success(entries);
    } on DioException catch (e, s) {
      log('Falha ao buscar as entidades', error: e, stackTrace: s);
      return Failure(RepositoryError('Falha ao buscar as entidades'));
    }
  }
}
