import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dio/dio.dart';

import 'search_cep_state.dart';

class SearchCepBloc extends Bloc<String, SearchCepState> {
  final Dio dio;

  SearchCepBloc({
    required this.dio,
  }) : super(SearchCepSucess(data: {}));

  @override
  Stream<SearchCepState> mapEventToState(String cep) async* {
    yield const SearchCepLoading();
    try {
      final response = await dio.get('https://viacep.com.br/ws/$cep/json/');

      yield SearchCepSucess(data: response.data);
    } catch (e) {
      yield const SearchCepError(message: 'Deu ruim!!!');
    }
  }
}
