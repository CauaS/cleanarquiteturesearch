import 'package:cleanarquiteturesearch/modules/search/domain/repositories/search_repository.dart';
import 'package:cleanarquiteturesearch/modules/search/infra/repositories/datasources/search_datasource.dart';
import 'package:cleanarquiteturesearch/modules/search/infra/repositories/models/result_search_model.dart';
import 'package:cleanarquiteturesearch/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_respository_impl_test.mocks.dart';

@GenerateMocks([ISearchDatasource],
  customMocks: [
    MockSpec<ISearchDatasource>(
      returnNullOnMissingStub: true
    )
  ]
)
void main() {
  final searchRepositoryMock = MockISearchDatasource();
  final repository = SearchRepositoryImpl(datasource: searchRepositoryMock);

  test("Should retorn a list of ResultSearch", () async {
    when(searchRepositoryMock.getSearch("abc"))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    // *Retorna um Either com left sendo um exception e right sendo uma lista de results;
    final result = await repository.search("cali");
    expect(result | [], isA<List<ResultSearchModel>>());
  });
}
