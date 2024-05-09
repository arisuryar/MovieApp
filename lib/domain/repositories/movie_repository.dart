import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/detail_movie_entity.dart';
import '../entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovie();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovie();
  Future<Either<Failure, List<MovieEntity>>> getUpComingMovie();
  Future<Either<Failure, List<MovieEntity>>> getSearchMovie(String query);
  Future<Either<Failure, DetailMovieEntity>> getDetailMovie(int id);
}
