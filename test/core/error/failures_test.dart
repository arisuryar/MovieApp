import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/error/failures.dart';

void main() {
  test(
    'NotFoundFailure',
    () async {
      expect(const NotFoundFailure('message'), isA<Failure>());
    },
  );
  test(
    'ServerFailure',
    () async {
      expect(const ServerFailure('message'), isA<Failure>());
    },
  );
  test(
    'GeneralFailure',
    () async {
      expect(const GeneralFailure('message'), isA<Failure>());
    },
  );
  test('Failure props should return correct list of objects', () {
    const failure = NotFoundFailure('Not Found');
    expect(failure.props, [failure.message]);
  });
}
