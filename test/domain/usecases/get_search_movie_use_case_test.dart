import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/error/message.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_search_movie_use_case.dart';

import '../../helpers/dummy_data/movie_data.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MovieRepository repository;
  late GetSearchMovieUseCase useCase;

  setUp(() {
    repository = MockMovieRepository();
    useCase = GetSearchMovieUseCase(repository);
  });

  group('Get Search Movie Use Case -', () {
    test(
      'Return [List<MovieEntity>] when repository is success',
      () async {
        // arrange
        when(repository.getSearchMovie('Godzilla x Kong: The New Empire')).thenAnswer(
          (_) async => Right([tMovieEntity]),
        );

        // act
        final result = await useCase('Godzilla x Kong: The New Empire');

        // assert
        expect(result.getOrElse(() => []), [tMovieEntity]);
      },
    );
    test(
      'Return [Failure] when repository is failed',
      () async {
        // arrange
        when(repository.getSearchMovie('Godzilla x Kong: The New Empire')).thenAnswer(
          (_) async => const Left(GeneralFailure(Message.general)),
        );

        // act
        final result = await useCase('Godzilla x Kong: The New Empire');

        // assert
        expect(result, const Left(GeneralFailure(Message.general)));
      },
    );
  });
}
