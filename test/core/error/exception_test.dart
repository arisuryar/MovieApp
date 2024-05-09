import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/error/exception.dart';

void main() {
  test(
    'GeneralException',
    () async {
      expect(GeneralException(), isA<Exception>());
    },
  );
  test(
    'NotFoundException',
    () async {
      expect(NotFoundException(), isA<Exception>());
    },
  );
  test(
    'ServerException',
    () async {
      expect(ServerException(), isA<Exception>());
    },
  );
}
