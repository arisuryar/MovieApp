import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasource/movie_remote_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_detail_movie_use_case.dart';
import 'domain/usecases/get_now_playing_movie_use_case.dart';
import 'domain/usecases/get_popular_movie_use_case.dart';
import 'domain/usecases/get_search_movie_use_case.dart';
import 'domain/usecases/get_up_coming_movie_use_case.dart';
import 'presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'presentation/bloc/home/home_bloc.dart';
import 'presentation/bloc/search/search_bloc.dart';

final locator = GetIt.instance;

class Injection {
  void init() {
    // Bloc
    locator.registerFactory(() => HomeBloc(locator(), locator(), locator()));
    locator.registerFactory(() => DetailMovieBloc(locator()));
    locator.registerFactory(() => SearchBloc(locator()));

    // Usecases
    locator.registerLazySingleton(() => GetDetailMovieUseCase(locator()));
    locator.registerLazySingleton(() => GetNowPlayingMovieUseCase(locator()));
    locator.registerLazySingleton(() => GetPopularMovieUseCase(locator()));
    locator.registerLazySingleton(() => GetSearchMovieUseCase(locator()));
    locator.registerLazySingleton(() => GetUpComingMovieUseCase(locator()));

    // Repository
    locator.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(locator()));

    // Datasource
    locator.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(locator()));

    // External
    locator.registerLazySingleton(() => http.Client());
  }
}
