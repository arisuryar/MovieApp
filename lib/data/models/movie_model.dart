import 'package:intl/intl.dart';

import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.tittle,
    required super.language,
    required super.overview,
    required super.poster,
    required super.release,
    required super.voteAverage,
    required super.voteCount,
    required super.backdrop,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      backdrop: json['backdrop_path'] ?? 'no-backdrop',
      language: json['original_language'],
      tittle: json['original_title'],
      overview: json['overview'],
      poster: json['poster_path'] ?? 'no-poster',
      release: DateTime.parse(json['release_date'] == null || json['release_date'] == ''
          ? DateFormat('y-mm-dd').format(DateTime.now())
          : json['release_date']),
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  MovieEntity get toEntity {
    return MovieEntity(
      id: id,
      tittle: tittle,
      language: language,
      overview: overview,
      poster: poster,
      backdrop: backdrop,
      release: release,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
