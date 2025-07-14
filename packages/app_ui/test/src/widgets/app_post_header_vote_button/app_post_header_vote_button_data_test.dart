import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockColorScheme extends Mock
    with Diagnosticable
    implements ColorScheme {}

void main() {
  late ColorScheme colorScheme;

  setUp(() {
    colorScheme = _MockColorScheme();
  });

  group(AppPostHeaderVoteButtonData, () {
    AppPostHeaderVoteButtonData createSubject({
      bool? hasBeenUpvoted,
    }) {
      return AppPostHeaderVoteButtonData(
        hasBeenUpvoted: hasBeenUpvoted ?? false,
        score: 'score',
        onPressed: () {},
      );
    }

    group('color', () {
      test('returns correct value when hasBeenUpvoted', () {
        const color = Colors.red;
        when(() => colorScheme.onSurface).thenReturn(color);
        final data = createSubject(
          hasBeenUpvoted: true,
        );
        expect(data.color(colorScheme), color);
      });

      test('returns correct value when !hasBeenUpvoted', () {
        const color = Colors.blue;
        when(() => colorScheme.onSurfaceVariant).thenReturn(color);
        final data = createSubject();
        expect(data.color(colorScheme), color);
      });
    });

    group('weight', () {
      test('returns correct value when hasBeenUpvoted', () {
        final data = createSubject(
          hasBeenUpvoted: true,
        );
        expect(data.weight, 700);
      });

      test('returns correct value when !hasBeenUpvoted', () {
        final data = createSubject();
        expect(data.weight, 500);
      });
    });
  });
}
