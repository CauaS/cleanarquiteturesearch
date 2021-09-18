import 'package:cleanarquiteturesearch/modules/search/infra/repositories/models/result_search_model.dart';

abstract class ISearchDatasource {
  Future<List<ResultSearchModel>> getSearch(String searchText);
}