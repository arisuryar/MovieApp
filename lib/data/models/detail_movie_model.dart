import 'package:intl/intl.dart';

import '../../domain/entities/detail_movie_entity.dart';

class DetailMovieModel extends DetailMovieEntity {
  const DetailMovieModel({
    required super.backdrop,
    required super.genres,
    required super.tittle,
    required super.overview,
    required super.path,
    required super.release,
    required super.runtime,
    required super.status,
    required super.voteAverage,
    required super.voteCount,
  });

  factory DetailMovieModel.fromJson(Map<String, dynamic> json) {
    return DetailMovieModel(
      backdrop: json['backdrop_path'] ?? 'no-backdrop',
      genres: List.from(json['genres'].map((genre) => genre['name'] as String)),
      tittle: json['original_title'],
      overview: json['overview'],
      path: json['poster_path'] ?? 'no-poster',
      release: DateTime.parse(json['release_date'] == null || json['release_date'] == ''
          ? DateFormat('y-mm-dd').format(DateTime.now())
          : json['release_date']),
      runtime: json['runtime'],
      status: json['status'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  DetailMovieEntity get toEntity {
    return DetailMovieEntity(
      backdrop: backdrop,
      genres: genres,
      tittle: tittle,
      overview: overview,
      path: path,
      release: release,
      runtime: runtime,
      status: status,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
