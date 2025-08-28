// ignore_for_file: prefer_const_constructors

import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PageStatus, () {
    group('isLoading', () {
      test('returns true when status '
          'is $PageLoading', () {
        final status = PageLoading();
        expect(status.isLoading, true);
      });

      test('returns false when status '
          'is not $PageLoading', () {
        final status = PageSuccess();
        expect(status.isLoading, false);
      });
    });

    group(PageInitial, () {
      group('progress', () {
        test('returns correct value', () {
          final status = PageInitial();
          expect(status.progress, 0);
        });
      });
    });

    group(PageLoading, () {
      group('progress', () {
        test('has correct default value', () {
          final status = PageLoading();
          expect(status.progress, 0);
        });
      });
    });

    group(PageSuccess, () {
      group('progress', () {
        test('returns correct value', () {
          final status = PageSuccess();
          expect(status.progress, 100);
        });
      });
    });

    group(PageFailure, () {
      group('progress', () {
        test('returns correct value', () {
          final status = PageFailure();
          expect(status.progress, 0);
        });
      });
    });
  });
}
