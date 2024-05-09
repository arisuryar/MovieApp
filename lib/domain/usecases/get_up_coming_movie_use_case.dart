import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetUpComingMovieUseCase {
  final MovieRepository _repository;

  GetUpComingMovieUseCase(this._repository);

  Future<Either<Failure, List<MovieEntity>>> call() async {
    return _repository.getUpComingMovie();
  }
}
