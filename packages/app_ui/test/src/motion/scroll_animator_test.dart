// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(ScrollAnimator, () {
    ScrollAnimator createSubject() => ScrollAnimator();

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
  });
}
