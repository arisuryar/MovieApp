import 'package:mockito/annotations.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:http/http.dart' as http;

@GenerateNiceMocks([
  MockSpec<MovieRepository>(as: #MockMovieRepository),
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {}
