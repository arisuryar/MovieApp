import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/data/models/movie_model.dart';

import '../../helpers/dummy_data/movie_data.dart';
import '../../helpers/json_reader.dart';

void main() {
  test(
    'from Json',
    () async {
      String jsonString = readJson('movie_list.json');
      List jsonList = jsonDecode(jsonString)['results'];

      // act
      final result = jsonList.map((e) => MovieModel.fromJson(e)).toList();

      // assert
      expect(result, [tMovieModel]);
    },
  );
  test(
    'to Entity',
    () async {
      // act
      final result = tMovieModel.toEntity;

      // assert
      expect(result, tMovieEntity);
    },
  );
}
