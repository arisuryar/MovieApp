import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/error/message.dart';
import 'package:movie_app/domain/usecases/get_search_movie_use_case.dart';
import 'package:movie_app/presentation/bloc/search/search_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../helpers/dummy_data/movie_data.dart';

class MockGetSearchMovieUseCase extends Mock implements GetSearchMovieUseCase {}

void main() {
  late MockGetSearchMovieUseCase getSearchMovieUseCase;
  late SearchBloc bloc;

  setUp(() {
    getSearchMovieUseCase = MockGetSearchMovieUseCase();
    bloc = SearchBloc(getSearchMovieUseCase);
  });

  blocTest<SearchBloc, SearchState>(
    'emits StateSearch [Loading, Loaded] when usecase is success.',
    build: () {
      when(() => getSearchMovieUseCase(any())).thenAnswer(
        (_) async => Right([tMovieEntity]),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const OnGetSearchMovie('Godzilla x Kong: The New Empire')),
    expect: () => [
      SearchState(state: StateSearch.loading, searchMovie: null, message: null),
      SearchState(state: StateSearch.loaded, searchMovie: [tMovieEntity], message: null),
    ],
  );

  blocTest<SearchBloc, SearchState>(
    'emits StateSearch [Loading, Failure] when usecase is failed.',
    build: () {
      when(() => getSearchMovieUseCase(any())).thenAnswer(
        (_) async => const Left(GeneralFailure(Message.general)),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const OnGetSearchMovie('Godzilla x Kong: The New Empire')),
    expect: () => [
      SearchState(state: StateSearch.loading, searchMovie: null, message: null),
      SearchState(state: StateSearch.failure, searchMovie: null, message: Message.general),
    ],
  );
}
