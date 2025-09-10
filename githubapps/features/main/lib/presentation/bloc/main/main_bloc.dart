import 'package:bloc/bloc.dart';
import 'package:main/data/models/users/user_request.dart';
import 'package:main/domain/usecases/main_usecase.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainUsecase usecase;
  MainBloc({required this.usecase}) : super(MainState()) {
    on<MainEvent>((event, emit) async {
      if (event is ChangeBottomIndex) {
        await _mapChangeIndexToState(event, emit);
      } else if (event is ChangeStatusState) {
        _mapChangeStatusToState(event, emit);
      }
    });
  }

  void _mapChangeStatusToState(
    ChangeStatusState event,
    Emitter<MainState> emit,
  ) {
    emit(
      state.copyWith(
        statusState: event.value,
        isRefreshObject: !state.isRefreshObject,
      ),
    );
  }

  Future<void> _mapChangeIndexToState(
    ChangeBottomIndex event,
    Emitter<MainState> emit,
  ) async {
    var r = await usecase.searchUsername(UserRequest(username: "dimasnurab"));
    emit(
      state.copyWith(
        isRefreshObject: !state.isRefreshObject,
        bottomNavIndex: event.value,
      ),
    );
  }
}
