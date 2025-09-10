import 'package:bloc/bloc.dart';
import 'package:main/domain/entities/repo/repo_entity.dart';
import 'package:main/domain/usecases/main_usecase.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/shared.dart';
import 'package:shared/utils/state_api.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MainUsecase usecase;
  HomeBloc({required this.usecase}) : super(HomeState()) {
    on<DoGetTrending>(_mapDogetTrendingToState);
  }

  Future<void> _mapDogetTrendingToState(
    DoGetTrending event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(stateApi: ResultStateApi.loading));

      var r = await usecase.getTrendingRepo();
      emit(state.copyWith(stateApi: ResultStateApi.done, data: r));
    } on ApiException catch (e) {
      emit(state.copyWith(stateApi: ResultStateApi.fail, errorMsg: e.message));
    }
  }
}
