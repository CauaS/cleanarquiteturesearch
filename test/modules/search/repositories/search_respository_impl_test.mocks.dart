// Mocks generated by Mockito 5.0.16 from annotations
// in cleanarquiteturesearch/test/modules/search/repositories/search_respository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:cleanarquiteturesearch/modules/search/infra/repositories/datasources/search_datasource.dart'
    as _i2;
import 'package:cleanarquiteturesearch/modules/search/infra/repositories/models/result_search_model.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [ISearchDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockISearchDatasource extends _i1.Mock implements _i2.ISearchDatasource {
  MockISearchDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ResultSearchModel>> getSearch(String? searchText) =>
      (super.noSuchMethod(Invocation.method(#getSearch, [searchText]),
              returnValue: Future<List<_i4.ResultSearchModel>>.value(
                  <_i4.ResultSearchModel>[]))
          as _i3.Future<List<_i4.ResultSearchModel>>);
  @override
  String toString() => super.toString();
}
