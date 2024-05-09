import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecases/get_search_movie_use_case.dart';

import '../../../domain/entities/movie_entity.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMovieUseCase _searchMovieUseCase;
  SearchBloc(this._searchMovieUseCase) : super(SearchState()) {
    // OnGetSearchMovie
    on<OnGetSearchMovie>((event, emit) async {
      emit(state.copyWith(state: StateSearch.loading));

      final result = await _searchMovieUseCase(event.query);

      result.fold(
        (failure) => emit(state.copyWith(state: StateSearch.failure, message: failure.message)),
        (data) => emit(state.copyWith(state: StateSearch.loaded, searchMovie: data)),
      );
    });
  }
}
