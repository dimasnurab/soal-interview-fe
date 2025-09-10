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

class DochangeTab extends SearchEvent {
  final int value;
  DochangeTab(this.value);
}

class DoGetStarred extends SearchEvent {
  final StaredRequest request;
  DoGetStarred(this.request);
}
