import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/error/message.dart';
import 'package:movie_app/domain/usecases/get_detail_movie_use_case.dart';
import 'package:movie_app/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../helpers/dummy_data/movie_data.dart';

class MockGetDetailMovieUseCase extends Mock implements GetDetailMovieUseCase {}

void main() {
  late MockGetDetailMovieUseCase useCase;
  late DetailMovieBloc bloc;

  setUp(() {
    useCase = MockGetDetailMovieUseCase();
    bloc = DetailMovieBloc(useCase);
  });

  blocTest<DetailMovieBloc, DetailMovieState>(
    'emits StateDetailMovie [Loading, Loaded] when usecase is success.',
    build: () {
      when(() => useCase(any())).thenAnswer(
        (_) async => Right(tDetailMovieEntity),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const OnGetDetailMovie(823464)),
    expect: () => [
      DetailMovieState(state: StateDetailMovie.loading, data: null, message: null),
      DetailMovieState(state: StateDetailMovie.loaded, data: tDetailMovieEntity, message: null),
    ],
  );

  blocTest<DetailMovieBloc, DetailMovieState>(
    'emits StateDetailMovie [Loading, Failure] when usecase is failed.',
    build: () {
      when(() => useCase(any())).thenAnswer(
        (_) async => const Left(GeneralFailure(Message.general)),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const OnGetDetailMovie(823464)),
    expect: () => [
      DetailMovieState(state: StateDetailMovie.loading, data: null, message: null),
      DetailMovieState(state: StateDetailMovie.failure, data: null, message: Message.general),
    ],
  );
}
