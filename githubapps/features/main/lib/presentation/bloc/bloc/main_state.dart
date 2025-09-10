part of 'main_bloc.dart';

@immutable
class MainState extends Equatable {
  final int bottomNavIndex;
  final bool isRefreshObject;
  const MainState({this.bottomNavIndex = 0, this.isRefreshObject = false});

  MainState copyWith({int? bottomNavIndex, bool? isRefreshObject}) => MainState(
    isRefreshObject: isRefreshObject ?? this.isRefreshObject,
    bottomNavIndex: bottomNavIndex ?? this.bottomNavIndex,
  );

  @override
  List<Object?> get props => [bottomNavIndex, isRefreshObject];
}
