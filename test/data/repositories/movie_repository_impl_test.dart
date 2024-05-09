import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/error/message.dart';
import 'package:movie_app/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';

import '../../helpers/dummy_data/movie_data.dart';

class MockMovieRemoteDataSource extends Mock implements MovieRemoteDataSource {}

void main() {
  late MockMovieRemoteDataSource remoteDataSource;
  late MovieRepositoryImpl repositoryImpl;

  setUp(() {
    remoteDataSource = MockMovieRemoteDataSource();
    repositoryImpl = MovieRepositoryImpl(remoteDataSource);
  });

  group('Movie Repository Impl -', () {
    group('Get Detail Movie -', () {
      test(
        'Return [DetailMovieEntity] when remote data source is success',
        () async {
          // arrange
          when(() => remoteDataSource.fetchDetailMovie(any())).thenAnswer(
            (_) async => tDetailMovieModel,
          );

          // act
          final result = await repositoryImpl.getDetailMovie(823464);

          // assert
          verify(() => remoteDataSource.fetchDetailMovie(823464));

          expect(result, Right(tDetailMovieModel.toEntity));
        },
      );
      test(
        'Return [Failure] when remote data source throw NotFoundException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchDetailMovie(any())).thenThrow(NotFoundException());

          // act
          final result = await repositoryImpl.getDetailMovie(823464);

          // assert
          verify(() => remoteDataSource.fetchDetailMovie(823464));

          expect(result, const Left(NotFoundFailure(Message.notFound)));
        },
      );
      test(
        'Return [Failure] when remote data source throw ServerException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchDetailMovie(any())).thenThrow(ServerException());

          // act
          final result = await repositoryImpl.getDetailMovie(823464);

          // assert
          verify(() => remoteDataSource.fetchDetailMovie(823464));

          expect(result, const Left(ServerFailure(Message.server)));
        },
      );
      test(
        'Return [Failure] when remote data source throw GeneralException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchDetailMovie(any())).thenThrow(GeneralException());

          // act
          final result = await repositoryImpl.getDetailMovie(823464);

          // assert
          verify(() => remoteDataSource.fetchDetailMovie(823464));

          expect(result, const Left(GeneralFailure(Message.general)));
        },
      );
    });

    group('Get Now Playing Movie -', () {
      test(
        'Return [List<MovieEntity>] when remote data source is success',
        () async {
          // arrange
          when(() => remoteDataSource.fetchNowPlayingMovie()).thenAnswer(
            (_) async => [tMovieModel],
          );

          // act
          final result = await repositoryImpl.getNowPlayingMovie();

          // assert
          verify(() => remoteDataSource.fetchNowPlayingMovie());

          // Bug Dartz Right List return
          final resultList = result.getOrElse(() => []);

          expect(resultList, [tMovieModel.toEntity]);
        },
      );
      test(
        'Return [Failure] when remote data source throw NotFoundException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchNowPlayingMovie()).thenThrow(NotFoundException());

          // act
          final result = await repositoryImpl.getNowPlayingMovie();

          // assert
          verify(() => remoteDataSource.fetchNowPlayingMovie());

          expect(result, const Left(NotFoundFailure(Message.notFound)));
        },
      );
      test(
        'Return [Failure] when remote data source throw ServerException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchNowPlayingMovie()).thenThrow(ServerException());

          // act
          final result = await repositoryImpl.getNowPlayingMovie();

          // assert
          verify(() => remoteDataSource.fetchNowPlayingMovie());

          expect(result, const Left(ServerFailure(Message.server)));
        },
      );
      test(
        'Return [Failure] when remote data source throw GeneralException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchNowPlayingMovie()).thenThrow(GeneralException());

          // act
          final result = await repositoryImpl.getNowPlayingMovie();

          // assert
          verify(() => remoteDataSource.fetchNowPlayingMovie());

          expect(result, const Left(GeneralFailure(Message.general)));
        },
      );
    });

    group('Get Popular Movie -', () {
      test(
        'Return [List<MovieEntity>] when remote data source is success',
        () async {
          // arrange
          when(() => remoteDataSource.fetchPopularMovie()).thenAnswer(
            (_) async => [tMovieModel],
          );

          // act
          final result = await repositoryImpl.getPopularMovie();

          // assert
          verify(() => remoteDataSource.fetchPopularMovie());

          // Bug Dartz Right List return
          final resultList = result.getOrElse(() => []);

          expect(resultList, [tMovieModel.toEntity]);
        },
      );
      test(
        'Return [Failure] when remote data source throw NotFoundException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchPopularMovie()).thenThrow(NotFoundException());

          // act
          final result = await repositoryImpl.getPopularMovie();

          // assert
          verify(() => remoteDataSource.fetchPopularMovie());

          expect(result, const Left(NotFoundFailure(Message.notFound)));
        },
      );
      test(
        'Return [Failure] when remote data source throw ServerException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchPopularMovie()).thenThrow(ServerException());

          // act
          final result = await repositoryImpl.getPopularMovie();

          // assert
          verify(() => remoteDataSource.fetchPopularMovie());

          expect(result, const Left(ServerFailure(Message.server)));
        },
      );
      test(
        'Return [Failure] when remote data source throw GeneralException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchPopularMovie()).thenThrow(GeneralException());

          // act
          final result = await repositoryImpl.getPopularMovie();

          // assert
          verify(() => remoteDataSource.fetchPopularMovie());

          expect(result, const Left(GeneralFailure(Message.general)));
        },
      );
    });
    group('Get Search Movie -', () {
      test(
        'Return [List<MovieEntity>] when remote data source is success',
        () async {
          // arrange
          when(() => remoteDataSource.fetchSearchMovie('Godzilla x Kong: The New Empire')).thenAnswer(
            (_) async => [tMovieModel],
          );

          // act
          final result = await repositoryImpl.getSearchMovie('Godzilla x Kong: The New Empire');

          // assert
          verify(() => remoteDataSource.fetchSearchMovie('Godzilla x Kong: The New Empire'));

          // Bug Dartz Right List return
          final resultList = result.getOrElse(() => []);

          expect(resultList, [tMovieModel.toEntity]);
        },
      );
      test(
        'Return [Failure] when remote data source throw NotFoundException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchSearchMovie('Godzilla x Kong: The New Empire')).thenThrow(NotFoundException());

          // act
          final result = await repositoryImpl.getSearchMovie('Godzilla x Kong: The New Empire');

          // assert
          verify(() => remoteDataSource.fetchSearchMovie('Godzilla x Kong: The New Empire'));

          expect(result, const Left(NotFoundFailure(Message.notFound)));
        },
      );
      test(
        'Return [Failure] when remote data source throw ServerException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchSearchMovie('Godzilla x Kong: The New Empire')).thenThrow(ServerException());

          // act
          final result = await repositoryImpl.getSearchMovie('Godzilla x Kong: The New Empire');

          // assert
          verify(() => remoteDataSource.fetchSearchMovie('Godzilla x Kong: The New Empire'));

          expect(result, const Left(ServerFailure(Message.server)));
        },
      );
      test(
        'Return [Failure] when remote data source throw GeneralException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchSearchMovie('Godzilla x Kong: The New Empire')).thenThrow(GeneralException());

          // act
          final result = await repositoryImpl.getSearchMovie('Godzilla x Kong: The New Empire');

          // assert
          verify(() => remoteDataSource.fetchSearchMovie('Godzilla x Kong: The New Empire'));

          expect(result, const Left(GeneralFailure(Message.general)));
        },
      );
    });

    group('Get Up Coming Movie -', () {
      test(
        'Return [List<MovieEntity>] when remote data source is success',
        () async {
          // arrange
          when(() => remoteDataSource.fetchUpComingMovie()).thenAnswer(
            (_) async => [tMovieModel],
          );

          // act
          final result = await repositoryImpl.getUpComingMovie();

          // assert
          verify(() => remoteDataSource.fetchUpComingMovie());

          // Bug Dartz Right List return
          final resultList = result.getOrElse(() => []);

          expect(resultList, [tMovieModel.toEntity]);
        },
      );
      test(
        'Return [Failure] when remote data source throw NotFoundException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchUpComingMovie()).thenThrow(NotFoundException());

          // act
          final result = await repositoryImpl.getUpComingMovie();

          // assert
          verify(() => remoteDataSource.fetchUpComingMovie());

          expect(result, const Left(NotFoundFailure(Message.notFound)));
        },
      );
      test(
        'Return [Failure] when remote data source throw ServerException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchUpComingMovie()).thenThrow(ServerException());

          // act
          final result = await repositoryImpl.getUpComingMovie();

          // assert
          verify(() => remoteDataSource.fetchUpComingMovie());

          expect(result, const Left(ServerFailure(Message.server)));
        },
      );
      test(
        'Return [Failure] when remote data source throw GeneralException',
        () async {
          // arrange
          when(() => remoteDataSource.fetchUpComingMovie()).thenThrow(GeneralException());

          // act
          final result = await repositoryImpl.getUpComingMovie();

          // assert
          verify(() => remoteDataSource.fetchUpComingMovie());

          expect(result, const Left(GeneralFailure(Message.general)));
        },
      );
    });
  });
}
