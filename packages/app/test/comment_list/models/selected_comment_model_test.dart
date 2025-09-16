// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockScrollAnimator extends Mock implements ScrollAnimator {}

void main() {
  group(SelectedCommentModel, () {
    late ScrollAnimator animator;

    setUp(() {
      animator = _MockScrollAnimator();
    });

    SelectedCommentModel createSubject() {
      return SelectedCommentModel(
        id: 'id',
        index: 1,
        animator: animator,
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
      test('returns animator.duration', () {
        const estimatedDistance = 1.0;
        final duration = Duration(milliseconds: 300);
        when(
          () => animator.duration(estimatedDistance),
        ).thenReturn(duration);
        final model = createSubject();
        expect(
          model.duration(estimatedDistance),
          duration,
        );
      });
    });
  });
}
