// ignore_for_file: must_be_immutable

part of 'detail_movie_bloc.dart';

enum StateDetailMovie { initial, loading, failure, loaded }

class DetailMovieState extends Equatable {
  StateDetailMovie? state;
  DetailMovieEntity? data;
  String? message;

  DetailMovieState({
    this.state = StateDetailMovie.initial,
    this.data,
    this.message,
  });

  DetailMovieState copyWith({
    StateDetailMovie? state,
    DetailMovieEntity? data,
    String? message,
  }) {
    return DetailMovieState(
      state: state ?? this.state,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [state, data, message];
}
