// ignore_for_file: prefer_const_constructors

import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PageStatus, () {
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
