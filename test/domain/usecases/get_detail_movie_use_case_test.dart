import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/error/message.dart';
import 'package:movie_app/domain/usecases/get_detail_movie_use_case.dart';

import '../../helpers/dummy_data/movie_data.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockMovieRepository repository;
  late GetDetailMovieUseCase useCase;

  setUp(() {
    repository = MockMovieRepository();
    useCase = GetDetailMovieUseCase(repository);
  });

  group('Get Detail Movie Use Case', () {
    test(
      'Return [List<MovieEntity>] when repository is success',
      () async {
        // arrange
        when(repository.getDetailMovie(any)).thenAnswer(
          (_) async => Right(tDetailMovieEntity),
        );

        // act
        final result = await useCase(823464);

        // assert
        expect(result, Right(tDetailMovieEntity));
      },
    );
    test(
      'Return [Failure] when repository is failed',
      () async {
        // arrange
        when(repository.getDetailMovie(any)).thenAnswer(
          (_) async => const Left(GeneralFailure(Message.general)),
        );

        // act
        final result = await useCase(823464);

        // assert
        expect(result, const Left(GeneralFailure(Message.general)));
      },
    );
  });
}
