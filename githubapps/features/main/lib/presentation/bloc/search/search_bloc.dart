import 'package:bloc/bloc.dart';
import 'package:main/domain/usecases/main_usecase.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/utils/state_api.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  MainUsecase usecase;
  SearchBloc({required this.usecase}) : super(SearchState()) {
    on<SearchEvent>((event, emit) {});
  }
}
