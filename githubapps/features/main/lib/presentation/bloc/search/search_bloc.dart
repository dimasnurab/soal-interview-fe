import 'package:bloc/bloc.dart';
import 'package:main/data/models/repo/repo_request.dart';
import 'package:main/data/models/users/user_request.dart';
import 'package:main/domain/entities/repo/repo_entity.dart';
import 'package:main/domain/entities/user/user_entity.dart';
import 'package:main/domain/usecases/main_usecase.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/shared.dart';
import 'package:shared/utils/state_api.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  MainUsecase usecase;
  SearchBloc({required this.usecase}) : super(SearchState()) {
    on<DoSearchUsername>(_mapDoSearchUsernameToState);
    on<DoSearchRepositories>(_mapDoSearchRepositoriesToState);
  }

  Future<void> _mapDoSearchUsernameToState(
    DoSearchUsername event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(state.copyWith(stateApi: ResultStateApi.loading, itemsRepo: []));
      var r = await usecase.searchUsername(UserRequest(username: event.value));
      emit(
        state.copyWith(
          stateApi: ResultStateApi.done,
          dataUser: r,
          indexBodyTab: 0,
        ),
      );

      add(DoSearchRepositories(RepoRequest(path: r.pathRepo ?? '', size: 10)));
    } on NotFoundException catch (e) {
      emit(
        state.copyWith(
          stateApi: ResultStateApi.notfound,
          errorMsg: e.message,
          dataUser: null,
        ),
      );
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          stateApi: ResultStateApi.fail,
          errorMsg: e.message,
          dataUser: null,
        ),
      );
    }
  }

  Future<void> _mapDoSearchRepositoriesToState(
    DoSearchRepositories event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(state.copyWith(stateRepositories: ResultStateApi.loading));
      var r = await usecase.getRepositoriesByUsername(event.request);
      emit(
        state.copyWith(stateRepositories: ResultStateApi.done, itemsRepo: r),
      );
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          stateRepositories: ResultStateApi.fail,
          errorMsg: e.message,
          itemsRepo: [],
        ),
      );
    }
  }
}
