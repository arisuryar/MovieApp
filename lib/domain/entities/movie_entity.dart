import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String tittle;
  final String language;
  final String overview;
  final String poster;
  final String backdrop;
  final DateTime release;
  final double voteAverage;
  final int voteCount;

  const MovieEntity({
    required this.id,
    required this.tittle,
    required this.language,
    required this.overview,
    required this.poster,
    required this.backdrop,
    required this.release,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object> get props {
    return [
      id,
      tittle,
      language,
      overview,
      poster,
      release,
      voteAverage,
      voteCount,
    ];
  }
}
