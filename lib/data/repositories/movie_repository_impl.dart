import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import '../../core/error/message.dart';
import '../../domain/entities/detail_movie_entity.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasource/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _remoteDataSource;

  MovieRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, DetailMovieEntity>> getDetailMovie(int id) async {
    try {
      final result = await _remoteDataSource.fetchDetailMovie(id);
      return Right(result.toEntity);
    } on ServerException {
      return const Left(ServerFailure(Message.server));
    } on NotFoundException {
      return const Left(NotFoundFailure(Message.notFound));
    } on GeneralException {
      return const Left(GeneralFailure(Message.general));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovie() async {
    try {
      final result = await _remoteDataSource.fetchNowPlayingMovie();
      return Right(result.map((e) => e.toEntity).toList());
    } on ServerException {
      return const Left(ServerFailure(Message.server));
    } on NotFoundException {
      return const Left(NotFoundFailure(Message.notFound));
    } on GeneralException {
      return const Left(GeneralFailure(Message.general));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovie() async {
    try {
      final result = await _remoteDataSource.fetchPopularMovie();
      return Right(result.map((e) => e.toEntity).toList());
    } on ServerException {
      return const Left(ServerFailure(Message.server));
    } on NotFoundException {
      return const Left(NotFoundFailure(Message.notFound));
    } on GeneralException {
      return const Left(GeneralFailure(Message.general));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getSearchMovie(String query) async {
    try {
      final result = await _remoteDataSource.fetchSearchMovie(query);
      return Right(result.map((e) => e.toEntity).toList());
    } on ServerException {
      return const Left(ServerFailure(Message.server));
    } on NotFoundException {
      return const Left(NotFoundFailure(Message.notFound));
    } on GeneralException {
      return const Left(GeneralFailure(Message.general));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpComingMovie() async {
    try {
      final result = await _remoteDataSource.fetchUpComingMovie();
      return Right(result.map((e) => e.toEntity).toList());
    } on ServerException {
      return const Left(ServerFailure(Message.server));
    } on NotFoundException {
      return const Left(NotFoundFailure(Message.notFound));
    } on GeneralException {
      return const Left(GeneralFailure(Message.general));
    }
  }
}
