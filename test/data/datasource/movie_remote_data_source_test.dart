import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/constant/urls.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/data/datasource/movie_remote_data_source.dart';
import 'package:http/http.dart' as http;

import '../../helpers/dummy_data/movie_data.dart';
import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MovieRemoteDataSourceImpl remoteDataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSourceImpl = MovieRemoteDataSourceImpl(mockHttpClient);
  });

  group('Movie Remote Data Source Impl -', () {
    group('Fetch Detail Movie -', () {
      test(
        'Return [DetailMovieModel] when status code is 200',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response(readJson('detail_movie.json'), 200, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            }),
          );

          // act
          final result = await remoteDataSourceImpl.fetchDetailMovie(823464);

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/823464?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, tDetailMovieModel);
        },
      );
      test(
        'Throw [NotFoundException] when status code is 404',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Not Found', 404),
          );

          // act
          final result = remoteDataSourceImpl.fetchDetailMovie(823464);

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/823464?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<NotFoundException>()));
        },
      );
      test(
        'Throw [ServerException] when status code is 500',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Failed Connect to Server', 500),
          );

          // act
          final result = remoteDataSourceImpl.fetchDetailMovie(823464);

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/823464?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<ServerException>()));
        },
      );
      test(
        'Throw [GeneralException] when status code is not 200, 400 and 500',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Something wrong', 600),
          );

          // act
          final result = remoteDataSourceImpl.fetchDetailMovie(823464);

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/823464?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<GeneralException>()));
        },
      );
    });
    group('Fetch Now Playing Movie -', () {
      test(
        'Return [Lit<MovieModel>] when status code is 200',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response(readJson('movie_list.json'), 200, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            }),
          );

          // act
          final result = await remoteDataSourceImpl.fetchNowPlayingMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/now_playing?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, [tMovieModel]);
        },
      );
      test(
        'Throw [NotFoundException] when status code is 404',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Not Found', 404),
          );

          // act
          final result = remoteDataSourceImpl.fetchNowPlayingMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/now_playing?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<NotFoundException>()));
        },
      );
      test(
        'Throw [ServerException] when status code is 500',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Failed Connect to Server', 500),
          );

          // act
          final result = remoteDataSourceImpl.fetchNowPlayingMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/now_playing?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<ServerException>()));
        },
      );
      test(
        'Throw [GeneralException] when status code is not 200, 400 and 500',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Something wrong', 600),
          );

          // act
          final result = remoteDataSourceImpl.fetchNowPlayingMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/now_playing?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<GeneralException>()));
        },
      );
    });
    group('Fetch Popular Movie -', () {
      test(
        'Return [Lit<MovieModel>] when status code is 200',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response(readJson('movie_list.json'), 200, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            }),
          );

          // act
          final result = await remoteDataSourceImpl.fetchPopularMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/popular?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, [tMovieModel]);
        },
      );
      test(
        'Throw [NotFoundException] when status code is 404',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Not Found', 404),
          );

          // act
          final result = remoteDataSourceImpl.fetchPopularMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/popular?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<NotFoundException>()));
        },
      );
      test(
        'Throw [ServerException] when status code is 500',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Failed Connect to Server', 500),
          );

          // act
          final result = remoteDataSourceImpl.fetchPopularMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/popular?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<ServerException>()));
        },
      );
      test(
        'Throw [GeneralException] when status code is not 200, 400 and 500',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Something wrong', 600),
          );

          // act
          final result = remoteDataSourceImpl.fetchPopularMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/popular?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<GeneralException>()));
        },
      );
    });
    group('Fetch UpComing Movie -', () {
      test(
        'Return [Lit<MovieModel>] when status code is 200',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response(readJson('movie_list.json'), 200, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            }),
          );

          // act
          final result = await remoteDataSourceImpl.fetchUpComingMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/upcoming?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, [tMovieModel]);
        },
      );
      test(
        'Throw [NotFoundException] when status code is 404',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Not Found', 404),
          );

          // act
          final result = remoteDataSourceImpl.fetchUpComingMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/upcoming?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<NotFoundException>()));
        },
      );
      test(
        'Throw [ServerException] when status code is 500',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Failed Connect to Server', 500),
          );

          // act
          final result = remoteDataSourceImpl.fetchUpComingMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/upcoming?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<ServerException>()));
        },
      );
      test(
        'Throw [GeneralException] when status code is not 200, 400 and 500',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Something wrong', 600),
          );

          // act
          final result = remoteDataSourceImpl.fetchUpComingMovie();

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/movie/upcoming?page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<GeneralException>()));
        },
      );
    });
    group('Fetch Search Movie -', () {
      String query = 'Godzilla x Kong: The New Empire';
      test(
        'Return [Lit<MovieModel>] when status code is 200',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response(readJson('movie_list.json'), 200, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            }),
          );

          // act
          final result = await remoteDataSourceImpl.fetchSearchMovie(query);

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/search/movie?query=$query?&page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, [tMovieModel]);
        },
      );
      test(
        'Throw [NotFoundException] when status code is 404',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Not Found', 404),
          );

          // act
          final result = remoteDataSourceImpl.fetchSearchMovie(query);

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/search/movie?query=$query?&page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<NotFoundException>()));
        },
      );
      test(
        'Throw [ServerException] when status code is 500',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Failed Connect to Server', 500),
          );

          // act
          final result = remoteDataSourceImpl.fetchSearchMovie(query);

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/search/movie?query=$query?&page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<ServerException>()));
        },
      );
      test(
        'Throw [GeneralException] when status code is not 200, 400 and 500',
        () async {
          // arrange
          when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Something wrong', 600),
          );

          // act
          final result = remoteDataSourceImpl.fetchSearchMovie(query);

          // assert
          verify(mockHttpClient.get(
            Uri.parse('${Urls.baseUrl}/search/movie?query=$query?&page=1&api_key=${Urls.apiKey}'),
          ));

          expect(result, throwsA(isA<GeneralException>()));
        },
      );
    });
  });
}
