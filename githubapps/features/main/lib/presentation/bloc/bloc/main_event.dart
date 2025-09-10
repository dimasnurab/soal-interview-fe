part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class ChangeBottomIndex extends MainEvent {
  final int value;
  ChangeBottomIndex(this.value);
}
