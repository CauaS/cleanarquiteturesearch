import 'package:cleanarquiteturesearch/modules/search/domain/entities/result_search.dart';
import 'package:cleanarquiteturesearch/modules/search/domain/errors/errors.dart';
import 'package:cleanarquiteturesearch/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

//Either obriga retornar dois valores, neste caso ou um exception ou lista de resultados.

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImp implements SearchByText{
  final ISearchRepository _searchRepository;

  SearchByTextImp(this._searchRepository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText) async {
    if(searchText.isEmpty ){
      return Left(InvalidTextError());
    }
    
    return await _searchRepository.search(searchText);
  }
}