part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final ResultStateApi stateApi;
  final String errorMsg;
  final bool isRefreshObject;

  const SearchState({
    this.errorMsg = '',
    this.isRefreshObject = false,
    this.stateApi = ResultStateApi.initial,
  });

  SearchState copyWith({
    ResultStateApi? stateApi,
    String? errorMsg,
    bool? isRefreshObject,
  }) => SearchState(
    stateApi: stateApi ?? this.stateApi,
    errorMsg: errorMsg ?? this.errorMsg,
    isRefreshObject: isRefreshObject ?? this.isRefreshObject,
  );
  @override
  List<Object?> get props => [isRefreshObject, stateApi, errorMsg];
}
