import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/detail_movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetDetailMovieUseCase {
  final MovieRepository _repository;

  GetDetailMovieUseCase(this._repository);

  Future<Either<Failure, DetailMovieEntity>> call(int id) async {
    return _repository.getDetailMovie(id);
  }
}
