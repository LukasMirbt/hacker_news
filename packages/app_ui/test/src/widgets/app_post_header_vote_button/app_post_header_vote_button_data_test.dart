import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockColorScheme extends Mock
    with Diagnosticable
    implements ColorScheme {}

class _MockTextTheme extends Mock with Diagnosticable implements TextTheme {}

void main() {
  group(AppPostHeaderVoteButtonData, () {
    late ColorScheme colorScheme;
    late TextTheme textTheme;

    setUp(() {
      colorScheme = _MockColorScheme();
      textTheme = _MockTextTheme();
    });

    AppPostHeaderVoteButtonData createSubject({
      bool? hasBeenUpvoted,
    }) {
      return AppPostHeaderVoteButtonData(
        hasBeenUpvoted: hasBeenUpvoted ?? false,
        score: 'score',
        onPressed: () {},
      );
    }

    group('iconColor', () {
      test('returns correct value when hasBeenUpvoted', () {
        const color = Colors.red;
        when(() => colorScheme.onSurface).thenReturn(color);
        final data = createSubject(
          hasBeenUpvoted: true,
        );
        expect(data.iconColor(colorScheme), color);
      });

      test('returns null when !hasBeenUpvoted', () {
        final data = createSubject();
        expect(data.iconColor(colorScheme), null);
      });
    });

    group('iconGrade', () {
      test('returns correct value when hasBeenUpvoted', () {
        final data = createSubject(
          hasBeenUpvoted: true,
        );
        expect(data.iconGrade, 200);
      });

      test('returns null when !hasBeenUpvoted', () {
        final data = createSubject();
        expect(data.iconGrade, null);
      });
    });

    group('textStyle', () {
      const style = TextStyle(
        fontVariations: [
          FontVariation.weight(400),
        ],
      );

      setUp(() {
        when(() => textTheme.bodyMedium).thenReturn(style);
      });

      const onSurface = Colors.blue;

      const upvotedStyle = TextStyle(
        color: onSurface,
        fontVariations: [
          FontVariation.weight(700),
        ],
      );

      test('returns correct style when hasBeenUpvoted', () {
        when(() => colorScheme.onSurface).thenReturn(onSurface);
        final data = createSubject(
          hasBeenUpvoted: true,
        );
        expect(
          data.textStyle(colorScheme, textTheme),
          upvotedStyle,
        );
      });

      test('returns null when !hasBeenUpvoted', () {
        final data = createSubject();
        expect(data.textStyle(colorScheme, textTheme), null);
      });
    });
  });
}
