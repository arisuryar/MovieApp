import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/constant/urls.dart';
import '../../core/error/exception.dart';
import '../models/detail_movie_model.dart';
import '../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> fetchNowPlayingMovie();
  Future<List<MovieModel>> fetchPopularMovie();
  Future<List<MovieModel>> fetchSearchMovie(String query);
  Future<List<MovieModel>> fetchUpComingMovie();
  Future<DetailMovieModel> fetchDetailMovie(int id);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client _client;

  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<DetailMovieModel> fetchDetailMovie(int id) async {
    final response = await _client.get(
      Uri.parse('${Urls.baseUrl}/movie/$id?page=1&api_key=${Urls.apiKey}'),
    );

    if (response.statusCode == 200) {
      return DetailMovieModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<List<MovieModel>> fetchNowPlayingMovie() async {
    final response = await _client.get(
      Uri.parse('${Urls.baseUrl}/movie/now_playing?page=1&api_key=${Urls.apiKey}'),
    );

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body)['results'];
      return jsonList.map((e) => MovieModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<List<MovieModel>> fetchPopularMovie() async {
    final response = await _client.get(
      Uri.parse('${Urls.baseUrl}/movie/popular?page=1&api_key=${Urls.apiKey}'),
    );

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body)['results'];
      return jsonList.map((e) => MovieModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<List<MovieModel>> fetchSearchMovie(String query) async {
    final response = await _client.get(
      Uri.parse('${Urls.baseUrl}/search/movie?query=$query?&page=1&api_key=${Urls.apiKey}'),
    );

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body)['results'];
      if (jsonList.isEmpty) {
        throw NotFoundException();
      }
      return jsonList.map((e) => MovieModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<List<MovieModel>> fetchUpComingMovie() async {
    final response = await _client.get(
      Uri.parse('${Urls.baseUrl}/movie/upcoming?page=1&api_key=${Urls.apiKey}'),
    );

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body)['results'];
      return jsonList.map((e) => MovieModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }
}
