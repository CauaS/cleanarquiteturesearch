import 'package:cleanarquiteturesearch/modules/search/domain/entities/result_search.dart';
import 'package:cleanarquiteturesearch/modules/search/domain/errors/errors.dart';
import 'package:cleanarquiteturesearch/modules/search/domain/repositories/search_repository.dart';
import 'package:cleanarquiteturesearch/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// * Nesta linha a libraty Mock está mockando um repository
class SearchRepositoryMock extends Mock implements SearchRespoitory {}

main() {
  final repository = SearchRepositoryMock();
  final usercase = SearchByTextImp(repository);

  test('should return a list od resultSearch', () async {
    // * Quando o metodo search do respository for chamado com qualquer valor string
    // * então retorne um o lado Right do Either sendo um List<ResultSearch>;
    when(repository.search("")).thenAnswer((_) async => const Right(<ResultSearch>[]));
    // ! outra possível forma: Future.value(const Right(<ResultSearch>[]);

    final result = await usercase("Cali");

    expect(result, isA<Right>());
    expect(result.isRight(), true);
  });

  test('should return a exception  if text is invalid', () async {
    // when(repository.search("cali"))
    //     .thenAnswer((_) async => const Right(<ResultSearch>[]));

    final result = await usercase("");
    expect(result.isLeft(), true);

    expect(result.fold((l) => l, (r) => r), isA<InvalidTextError>());
  });
}
