part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final String errorMsg;
  final bool isRefreshObject;
  final ResultStateApi stateApi;
  final List<RepoEntity> data;

  const HomeState({
    this.data = const <RepoEntity>[],
    this.errorMsg = '',
    this.isRefreshObject = false,
    this.stateApi = ResultStateApi.initial,
  });

  HomeState copyWith({
    String? errorMsg,
    bool? isRefreshObject,
    ResultStateApi? stateApi,
    List<RepoEntity>? data,
  }) => HomeState(
    errorMsg: errorMsg ?? this.errorMsg,
    data: data ?? this.data,
    stateApi: stateApi ?? this.stateApi,
    isRefreshObject: isRefreshObject ?? this.isRefreshObject,
  );

  @override
  List<Object?> get props => [isRefreshObject, stateApi, data, errorMsg];
}
