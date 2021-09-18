import 'package:cleanarquiteturesearch/modules/search/domain/errors/errors.dart';
import 'package:cleanarquiteturesearch/modules/search/infra/repositories/datasources/search_datasource.dart';
import 'package:cleanarquiteturesearch/modules/search/infra/repositories/models/result_search_model.dart';
import 'package:dio/dio.dart';

extension on String {
  normalise() {
    return replaceAll(" ", "+");
  }
}

class GithubSearchDatasource implements ISearchDatasource {
  final Dio dio;

  GithubSearchDatasource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio
        .get('https://api.github.com/search/users?q=${searchText.normalise()}');

    if (response.statusCode == 200) {
      final list = (response.data['itens'] as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();
      
      return list;
    }else{
      throw DatasourceError(message: "Ocorreu um erro ao fazer a buscas");
    }
  }
}
