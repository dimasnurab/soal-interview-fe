part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class DoSearchUsername extends SearchEvent {
  final String value;
  DoSearchUsername(this.value);
}

class DoSearchRepositories extends SearchEvent {
  final RepoRequest request;
  DoSearchRepositories(this.request);
}
