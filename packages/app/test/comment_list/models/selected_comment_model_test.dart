// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(SelectedCommentModel, () {
    SelectedCommentModel createSubject() {
      return SelectedCommentModel(
        id: 'id',
        index: 1,
      );
    }

    group('alignment', () {
      test('returns correct value', () {
        final model = createSubject();
        expect(model.alignment, 0);
      });
    });

    group('curve', () {
      test('returns correct value', () {
        final model = createSubject();
        expect(model.curve(0), Curves.easeInOut);
      });
    });

    group('duration', () {
      test('returns correct value '
          'when estimatedDistance > 2000', () {
        final model = createSubject();
        expect(model.duration(2001), Duration.zero);
      });

      test('returns correct value '
          'when calculatedValue < min', () {
        final model = createSubject();
        expect(model.duration(100), Duration(milliseconds: 250));
      });

      test(
        'returns correct value '
        'when calculatedValue > max',
        () {
          final model = createSubject();
          expect(model.duration(1000), Duration(milliseconds: 600));
        },
      );

      test('returns correct value '
          'when calculatedValue is within clamp range', () {
        final model = createSubject();
        expect(model.duration(500), Duration(milliseconds: 400));
      });
    });

    test('is not equatable', () {
      final first = createSubject();
      final second = createSubject();
      expect(first == second, false);
    });
  });
}
