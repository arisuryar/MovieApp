import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/error/message.dart';
import 'package:movie_app/domain/usecases/get_up_coming_movie_use_case.dart';

import '../../helpers/dummy_data/movie_data.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockMovieRepository repository;
  late GetUpComingMovieUseCase useCase;

  setUp(() {
    repository = MockMovieRepository();
    useCase = GetUpComingMovieUseCase(repository);
  });

  group('Get Up Coming Movie Use Case -', () {
    test(
      'Return [List<MovieEntity>] when repository is success',
      () async {
        // arrange
        when(repository.getUpComingMovie()).thenAnswer(
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
        when(repository.getUpComingMovie()).thenAnswer(
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
