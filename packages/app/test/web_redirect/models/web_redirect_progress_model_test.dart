// ignore_for_file: prefer_const_constructors

import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(WebRedirectProgressModel, () {
    WebRedirectProgressModel createSubject(PageStatus status) {
      return WebRedirectProgressModel(status: status);
    }

    group('value', () {
      test('returns correct value when progress is 0', () {
        final model = createSubject(PageLoading());
        expect(model.value, 0.0);
      });

      test('returns correct value when progress is 50', () {
        final model = createSubject(PageLoading(50));
        expect(model.value, 0.5);
      });

      test('returns correct value when progress is 100', () {
        final model = createSubject(PageLoading(100));
        expect(model.value, 1.0);
      });
    });

    group('opacity', () {
      test('returns correct value when status '
          'is $PageLoading', () {
        final model = createSubject(PageLoading());
        expect(model.opacity, 1.0);
      });

      test('returns correct value when status '
          'is not $PageLoading', () {
        final model = createSubject(PageInitial());
        expect(model.opacity, 0.0);
      });
    });
  });
}
