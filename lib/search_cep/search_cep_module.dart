import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'search_cep_bloc.dart';

final i = GetIt.instance;

initSearchCepModule() {
  i.registerSingleton(Dio());
  i.registerSingleton(SearchCepBloc(dio: i()));
}

disposeSearchCepModule() {
  i<SearchCepBloc>().close();
  i.unregister<SearchCepBloc>();
  i.unregister<Dio>();
}
