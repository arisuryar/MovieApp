// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

enum StateHome { initial, loading, failure, loaded }

class HomeState extends Equatable {
  StateHome? state;
  List<MovieEntity>? nowPlaying;
  List<MovieEntity>? popular;
  List<MovieEntity>? upComing;
  String? message;

  HomeState({
    this.state = StateHome.initial,
    this.nowPlaying,
    this.popular,
    this.upComing,
    this.message,
  });

  HomeState copyWith({
    StateHome? state,
    List<MovieEntity>? nowPlaying,
    List<MovieEntity>? popular,
    List<MovieEntity>? upComing,
    String? message,
  }) {
    return HomeState(
      state: state ?? this.state,
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      upComing: upComing ?? this.upComing,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [state, nowPlaying, popular, upComing, message];
}
