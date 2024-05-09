import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/data/models/detail_movie_model.dart';

import '../../helpers/dummy_data/movie_data.dart';
import '../../helpers/json_reader.dart';

void main() {
  test(
    'from Json',
    () async {
      String jsonString = readJson('detail_movie.json');
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      // act
      final result = DetailMovieModel.fromJson(jsonMap);

      // assert
      expect(result, tDetailMovieModel);
    },
  );
  test(
    'to Entity',
    () async {
      // act
      final result = tDetailMovieModel.toEntity;

      // assert
      expect(result, tDetailMovieEntity);
    },
  );
}
