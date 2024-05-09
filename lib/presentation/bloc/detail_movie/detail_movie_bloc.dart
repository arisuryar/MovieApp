import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/detail_movie_entity.dart';
import 'package:movie_app/domain/usecases/get_detail_movie_use_case.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final GetDetailMovieUseCase _detailMovieUseCase;
  DetailMovieBloc(this._detailMovieUseCase) : super(DetailMovieState()) {
    // OnGetDetailMovie
    on<OnGetDetailMovie>((event, emit) async {
      emit(state.copyWith(state: StateDetailMovie.loading));

      final result = await _detailMovieUseCase(event.id);

      result.fold(
        (failure) => emit(state.copyWith(state: StateDetailMovie.failure, message: failure.message)),
        (data) => emit(state.copyWith(state: StateDetailMovie.loaded, data: data)),
      );
    });
  }
}
