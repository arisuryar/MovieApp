import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/error/message.dart';
import 'package:movie_app/domain/usecases/get_now_playing_movie_use_case.dart';

import '../../helpers/dummy_data/movie_data.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockMovieRepository repository;
  late GetNowPlayingMovieUseCase useCase;

  setUp(() {
    repository = MockMovieRepository();
    useCase = GetNowPlayingMovieUseCase(repository);
  });

  group('Get Now Playing Movie Use Case -', () {
    test(
      'Return [List<MovieEntity>] when repository is success',
      () async {
        // arrange
        when(repository.getNowPlayingMovie()).thenAnswer(
          (_) async => Right([tMovieEntity]),
        );

        // act
        final result = await useCase();

        // assert
        final listResult = result.getOrElse(() => []);
        expect(listResult, [tMovieEntity]);
      },
    );
    test(
      'Return [Failure] when repository is failed',
      () async {
        // arrange
        when(repository.getNowPlayingMovie()).thenAnswer(
          (_) async => const Left(GeneralFailure(Message.general)),
        );

        // act
        final result = await useCase();

        // assert
        expect(result, const Left(GeneralFailure(Message.general)));
      },
    );
  });
}
