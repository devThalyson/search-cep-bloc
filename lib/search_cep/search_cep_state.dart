abstract class SearchCepState {}

class SearchCepSucess implements SearchCepState {
  final Map data;

  const SearchCepSucess({
    required this.data,
  });
}

class SearchCepError implements SearchCepState {
  final String message;

  const SearchCepError({
    required this.message,
  });
}

class SearchCepLoading implements SearchCepState {
  const SearchCepLoading();
}
