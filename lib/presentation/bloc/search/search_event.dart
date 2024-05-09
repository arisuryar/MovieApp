part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class OnGetSearchMovie extends SearchEvent {
  final String query;

  const OnGetSearchMovie(this.query);
}
