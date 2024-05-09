part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class OnGetNowPlaying extends HomeEvent {}

class OnGetPopular extends HomeEvent {}

class OnGetUpComing extends HomeEvent {}
