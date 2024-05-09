import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetSearchMovieUseCase {
  final MovieRepository _repository;

  GetSearchMovieUseCase(this._repository);

  Future<Either<Failure, List<MovieEntity>>> call(String query) async {
    return _repository.getSearchMovie(query);
  }
}
