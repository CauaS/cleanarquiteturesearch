import 'package:cleanarquiteturesearch/modules/search/domain/entities/result_search.dart';
import 'package:cleanarquiteturesearch/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRespoitory {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}