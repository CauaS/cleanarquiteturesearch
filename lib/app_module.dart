import 'dart:html';

import 'package:cleanarquiteturesearch/modules/search/domain/usecases/search_by_text.dart';
import 'package:cleanarquiteturesearch/modules/search/external/datasources/github_datasource.dart';
import 'package:cleanarquiteturesearch/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => SearchByTextImp(i())),
    Bind((i) => SearchRepositoryImpl(datasource: i())),
    Bind((i) => GithubSearchDatasource(i()))
  ];

  @override
  final List<ModularRoute> routes = [];
}
