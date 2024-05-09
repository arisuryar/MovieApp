import 'package:equatable/equatable.dart';

class DetailMovieEntity extends Equatable {
  final String backdrop;
  final List<String> genres;
  final String tittle;
  final String overview;
  final String path;
  final DateTime release;
  final int runtime;
  final String status;
  final double voteAverage;
  final int voteCount;

  const DetailMovieEntity({
    required this.backdrop,
    required this.genres,
    required this.tittle,
    required this.overview,
    required this.path,
    required this.release,
    required this.runtime,
    required this.status,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object> get props {
    return [
      backdrop,
      genres,
      tittle,
      overview,
      path,
      release,
      runtime,
      status,
      voteAverage,
      voteCount,
    ];
  }
}
