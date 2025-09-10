part of 'main_bloc.dart';

enum MainStatusState { unknown, authorize }

@immutable
class MainState extends Equatable {
  final MainStatusState statusState;
  final int bottomNavIndex;
  final bool isRefreshObject;
  const MainState({
    this.bottomNavIndex = 0,
    this.isRefreshObject = false,
    this.statusState = MainStatusState.unknown,
  });

  MainState copyWith({
    int? bottomNavIndex,
    bool? isRefreshObject,
    MainStatusState? statusState,
  }) => MainState(
    isRefreshObject: isRefreshObject ?? this.isRefreshObject,
    bottomNavIndex: bottomNavIndex ?? this.bottomNavIndex,
    statusState: statusState ?? this.statusState,
  );

  @override
  List<Object?> get props => [bottomNavIndex, isRefreshObject, statusState];
}
