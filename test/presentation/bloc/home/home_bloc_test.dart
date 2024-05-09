import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/error/message.dart';
import 'package:movie_app/domain/usecases/get_now_playing_movie_use_case.dart';
import 'package:movie_app/domain/usecases/get_popular_movie_use_case.dart';
import 'package:movie_app/domain/usecases/get_up_coming_movie_use_case.dart';
import 'package:movie_app/presentation/bloc/home/home_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../helpers/dummy_data/movie_data.dart';

class MockGetNowPlayingMovieUseCase extends Mock implements GetNowPlayingMovieUseCase {}

class MockGetPopularMovieUseCase extends Mock implements GetPopularMovieUseCase {}

class MockGetUpComingMovieUseCase extends Mock implements GetUpComingMovieUseCase {}

void main() {
  late MockGetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  late MockGetPopularMovieUseCase getPopularMovieUseCase;
  late MockGetUpComingMovieUseCase getUpComingMovieUseCase;
  late HomeBloc bloc;

  setUp(() {
    getNowPlayingMovieUseCase = MockGetNowPlayingMovieUseCase();
    getPopularMovieUseCase = MockGetPopularMovieUseCase();
    getUpComingMovieUseCase = MockGetUpComingMovieUseCase();
    bloc = HomeBloc(getNowPlayingMovieUseCase, getPopularMovieUseCase, getUpComingMovieUseCase);
  });

  group('OnGetNowPlaying', () {
    blocTest<HomeBloc, HomeState>(
      'emits StateHome [Loading, Loaded] when usecase is success.',
      build: () {
        when(() => getNowPlayingMovieUseCase()).thenAnswer(
          (_) async => Right([tMovieEntity]),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetNowPlaying()),
      expect: () => [
        HomeState(state: StateHome.loading, message: null, nowPlaying: null, popular: null, upComing: null),
        HomeState(state: StateHome.loaded, message: null, nowPlaying: [tMovieEntity], popular: null, upComing: null),
      ],
    );
    blocTest<HomeBloc, HomeState>(
      'emits StateHome [Loading, Failure] when usecase is failed.',
      build: () {
        when(() => getNowPlayingMovieUseCase()).thenAnswer(
          (_) async => const Left(GeneralFailure(Message.general)),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetNowPlaying()),
      expect: () => [
        HomeState(state: StateHome.loading, message: null, nowPlaying: null, popular: null, upComing: null),
        HomeState(state: StateHome.failure, message: Message.general, nowPlaying: null, popular: null, upComing: null),
      ],
    );
  });
  group('OnGetPopular', () {
    blocTest<HomeBloc, HomeState>(
      'emits StateHome [Loading, Loaded] when usecase is success.',
      build: () {
        when(() => getPopularMovieUseCase()).thenAnswer(
          (_) async => Right([tMovieEntity]),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetPopular()),
      expect: () => [
        HomeState(state: StateHome.loading, message: null, nowPlaying: null, popular: null, upComing: null),
        HomeState(state: StateHome.loaded, message: null, nowPlaying: null, popular: [tMovieEntity], upComing: null),
      ],
    );
    blocTest<HomeBloc, HomeState>(
      'emits StateHome [Loading, Failure] when usecase is failed.',
      build: () {
        when(() => getPopularMovieUseCase()).thenAnswer(
          (_) async => const Left(GeneralFailure(Message.general)),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetPopular()),
      expect: () => [
        HomeState(state: StateHome.loading, message: null, nowPlaying: null, popular: null, upComing: null),
        HomeState(state: StateHome.failure, message: Message.general, nowPlaying: null, popular: null, upComing: null),
      ],
    );
  });
  group('OnGetUpComing', () {
    blocTest<HomeBloc, HomeState>(
      'emits StateHome [Loading, Loaded] when usecase is success.',
      build: () {
        when(() => getUpComingMovieUseCase()).thenAnswer(
          (_) async => Right([tMovieEntity]),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetUpComing()),
      expect: () => [
        HomeState(state: StateHome.loading, message: null, nowPlaying: null, popular: null, upComing: null),
        HomeState(state: StateHome.loaded, message: null, nowPlaying: null, popular: null, upComing: [tMovieEntity]),
      ],
    );
    blocTest<HomeBloc, HomeState>(
      'emits StateHome [Loading, Failure] when usecase is failed.',
      build: () {
        when(() => getUpComingMovieUseCase()).thenAnswer(
          (_) async => const Left(GeneralFailure(Message.general)),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetUpComing()),
      expect: () => [
        HomeState(state: StateHome.loading, message: null, nowPlaying: null, popular: null, upComing: null),
        HomeState(state: StateHome.failure, message: Message.general, nowPlaying: null, popular: null, upComing: null),
      ],
    );
  });
}
