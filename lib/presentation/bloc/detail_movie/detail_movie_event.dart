part of 'detail_movie_bloc.dart';

sealed class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}

class OnGetDetailMovie extends DetailMovieEvent {
  final int id;

  const OnGetDetailMovie(this.id);
}
