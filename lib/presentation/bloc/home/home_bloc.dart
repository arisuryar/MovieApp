import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecases/get_now_playing_movie_use_case.dart';
import 'package:movie_app/domain/usecases/get_popular_movie_use_case.dart';
import 'package:movie_app/domain/usecases/get_up_coming_movie_use_case.dart';

import '../../../domain/entities/movie_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetNowPlayingMovieUseCase _nowPlayingMovieUseCase;
  final GetPopularMovieUseCase _popularMovieUseCase;
  final GetUpComingMovieUseCase _upComingMovieUseCase;

  HomeBloc(
    this._nowPlayingMovieUseCase,
    this._popularMovieUseCase,
    this._upComingMovieUseCase,
  ) : super(HomeState()) {
    // GetNowPlayingMovie
    on<OnGetNowPlaying>((event, emit) async {
      emit(state.copyWith(state: StateHome.loading));

      final result = await _nowPlayingMovieUseCase();

      result.fold(
        (failure) => emit(state.copyWith(state: StateHome.failure, message: failure.message)),
        (data) => emit(state.copyWith(state: StateHome.loaded, nowPlaying: data)),
      );
    });

    // GetPopularMovie
    on<OnGetPopular>((event, emit) async {
      emit(state.copyWith(state: StateHome.loading));

      final result = await _popularMovieUseCase();

      result.fold(
        (failure) => emit(state.copyWith(state: StateHome.failure, message: failure.message)),
        (data) => emit(state.copyWith(state: StateHome.loaded, popular: data)),
      );
    });

    // GetUpComingMovie
    on<OnGetUpComing>((event, emit) async {
      emit(state.copyWith(state: StateHome.loading));

      final result = await _upComingMovieUseCase();

      result.fold(
        (failure) => emit(state.copyWith(state: StateHome.failure, message: failure.message)),
        (data) => emit(state.copyWith(state: StateHome.loaded, upComing: data)),
      );
    });
  }
}
