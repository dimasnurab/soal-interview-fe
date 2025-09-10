part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final ResultStateApi stateApi;
  final ResultStateApi stateRepositories;
  final ResultStateApi stateStarred;
  final String errorMsg;
  final bool isRefreshObject;
  final UserEntity? dataUser;
  final int indexBodyTab;
  final List<RepoEntity> itemsRepo;
  final List<RepoEntity> itemsStarred;
  const SearchState({
    this.errorMsg = '',
    this.dataUser,
    this.stateStarred = ResultStateApi.initial,
    this.isRefreshObject = false,
    this.stateApi = ResultStateApi.initial,
    this.indexBodyTab = 0,
    this.stateRepositories = ResultStateApi.initial,
    this.itemsRepo = const <RepoEntity>[],
    this.itemsStarred = const <RepoEntity>[],
  });

  SearchState copyWith({
    ResultStateApi? stateApi,
    String? errorMsg,
    bool? isRefreshObject,
    Object? dataUser = _unchanged,
    int? indexBodyTab,
    ResultStateApi? stateRepositories,
    List<RepoEntity>? itemsRepo,
    List<RepoEntity>? itemsStarred,
    ResultStateApi? stateStarred,
  }) => SearchState(
    stateApi: stateApi ?? this.stateApi,
    errorMsg: errorMsg ?? this.errorMsg,
    isRefreshObject: isRefreshObject ?? this.isRefreshObject,
    indexBodyTab: indexBodyTab ?? this.indexBodyTab,
    stateRepositories: stateRepositories ?? this.stateRepositories,
    itemsRepo: itemsRepo ?? this.itemsRepo,
    stateStarred: stateStarred ?? this.stateStarred,
    itemsStarred: itemsStarred ?? this.itemsStarred,
    dataUser: identical(dataUser, _unchanged)
        ? this.dataUser
        : dataUser as UserEntity?,
  );

  static const _unchanged = Object();

  @override
  List<Object?> get props => [
    isRefreshObject,
    stateApi,
    errorMsg,
    dataUser,
    indexBodyTab,
    stateRepositories,
    itemsRepo,
    stateStarred,
    itemsStarred,
  ];
}
