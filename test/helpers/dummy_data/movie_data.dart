import 'package:movie_app/data/models/detail_movie_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/entities/detail_movie_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

final tMovieEntity = MovieEntity(
  id: 823464,
  tittle: 'Godzilla x Kong: The New Empire',
  language: 'en',
  overview:
      'Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.',
  poster: '/1DTP1Ph4uzNO6ofRUm7eAimWoKD.jpg',
  backdrop: '/qrGtVFxaD8c7et0jUtaYhyTzzPg.jpg',
  release: DateTime.parse('2024-03-27'),
  voteAverage: 6.5,
  voteCount: 953,
);
MovieModel tMovieModel = MovieModel(
  id: 823464,
  tittle: 'Godzilla x Kong: The New Empire',
  language: 'en',
  backdrop: '/qrGtVFxaD8c7et0jUtaYhyTzzPg.jpg',
  overview:
      'Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.',
  poster: '/1DTP1Ph4uzNO6ofRUm7eAimWoKD.jpg',
  release: DateTime.parse('2024-03-27'),
  voteAverage: 6.5,
  voteCount: 953,
);

final tDetailMovieEntity = DetailMovieEntity(
  backdrop: '/qrGtVFxaD8c7et0jUtaYhyTzzPg.jpg',
  genres: const ['Action', 'Science Fiction', 'Adventure'],
  tittle: 'Godzilla x Kong: The New Empire',
  overview:
      'Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.',
  path: '/1DTP1Ph4uzNO6ofRUm7eAimWoKD.jpg',
  release: DateTime.parse('2024-03-27'),
  runtime: 115,
  status: 'Released',
  voteAverage: 6.466,
  voteCount: 953,
);

final tDetailMovieModel = DetailMovieModel(
  backdrop: '/qrGtVFxaD8c7et0jUtaYhyTzzPg.jpg',
  genres: const ['Action', 'Science Fiction', 'Adventure'],
  tittle: 'Godzilla x Kong: The New Empire',
  overview:
      'Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.',
  path: '/1DTP1Ph4uzNO6ofRUm7eAimWoKD.jpg',
  release: DateTime.parse('2024-03-27'),
  runtime: 115,
  status: 'Released',
  voteAverage: 6.466,
  voteCount: 953,
);
