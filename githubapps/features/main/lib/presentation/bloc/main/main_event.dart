part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class ChangeBottomIndex extends MainEvent {
  final int value;
  ChangeBottomIndex(this.value);
}

class ChangeStatusState extends MainEvent {
  final MainStatusState value;
  ChangeStatusState(this.value);
}
