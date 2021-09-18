import 'package:cleanarquiteturesearch/modules/search/domain/errors/errors.dart';
import 'package:cleanarquiteturesearch/modules/search/domain/entities/result_search.dart';
import 'package:cleanarquiteturesearch/modules/search/domain/repositories/search_repository.dart';
import 'package:cleanarquiteturesearch/modules/search/infra/repositories/datasources/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements ISearchRepository {
  final ISearchDatasource datasource;

  SearchRepositoryImpl({required this.datasource});

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    }catch (e) {
      return Left(DatasourceError(message: "Ocorreu um erro desconhecido."));
    }
  }
}
