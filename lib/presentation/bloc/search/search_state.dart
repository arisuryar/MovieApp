// ignore_for_file: must_be_immutable

part of 'search_bloc.dart';

enum StateSearch { initial, loading, failure, loaded }

class SearchState extends Equatable {
  StateSearch? state;
  List<MovieEntity>? searchMovie;
  String? message;

  SearchState({
    this.state = StateSearch.initial,
    this.searchMovie,
    this.message,
  });

  SearchState copyWith({
    StateSearch? state,
    List<MovieEntity>? searchMovie,
    String? message,
  }) {
    return SearchState(
      state: state ?? this.state,
      searchMovie: searchMovie ?? this.searchMovie,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [state, searchMovie, message];
}
