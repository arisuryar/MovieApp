import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/error/message.dart';
import 'package:movie_app/domain/usecases/get_popular_movie_use_case.dart';

import '../../helpers/dummy_data/movie_data.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockMovieRepository repository;
  late GetPopularMovieUseCase useCase;

  setUp(() {
    repository = MockMovieRepository();
    useCase = GetPopularMovieUseCase(repository);
  });

  group('Get Popular Movie Use Case -', () {
    test(
      'Return [List<MovieEntity>] when repository is success',
      () async {
        // arrange
        when(repository.getPopularMovie()).thenAnswer(
          (_) async => Right([tMovieEntity]),
        );

        // act
        final result = await useCase();

        // assert
        expect(result.getOrElse(() => []), [tMovieEntity]);
      },
    );
    test(
      'Return [Failure] when repository is failed',
      () async {
        // arrange
        when(repository.getPopularMovie()).thenAnswer(
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
