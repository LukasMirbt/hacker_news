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
  group(AppFeedItemData, () {
    late ColorScheme colorScheme;
    late TextTheme textTheme;

    setUp(() {
      colorScheme = _MockColorScheme();
      textTheme = _MockTextTheme();
    });

    AppFeedItemData createSubject({bool? hasBeenVisited}) {
      return AppFeedItemData(
        hasBeenVisited: hasBeenVisited ?? false,
        rank: '',
        title: '',
        age: '',
        urlHost: null,
        user: null,
        onPressed: () {},
        onSharePressed: () {},
        onMorePressed: () {},
        voteButton: null,
        commentCountButton: null,
      );
    }

    group('titleStyle', () {
      const style = TextStyle(
        fontVariations: [
          FontVariation.weight(700),
        ],
      );

      setUp(() {
        when(() => textTheme.titleMedium).thenReturn(style);
      });

      const onSurfaceVariant = Colors.red;
      const onSurface = Colors.blue;

      const visitedStyle = TextStyle(
        color: onSurfaceVariant,
        fontVariations: [
          FontVariation.weight(630),
        ],
      );

      const unvisitedStyle = TextStyle(
        color: onSurface,
        fontVariations: [
          FontVariation.weight(700),
        ],
      );

      test('returns correct style when hasBeenVisited', () {
        when(() => colorScheme.onSurfaceVariant).thenReturn(
          onSurfaceVariant,
        );
        final data = createSubject(
          hasBeenVisited: true,
        );
        expect(
          data.titleStyle(colorScheme, textTheme),
          visitedStyle,
        );
      });

      test('returns correct style when !hasBeenVisited', () {
        when(() => colorScheme.onSurface).thenReturn(onSurface);
        final data = createSubject();
        expect(
          data.titleStyle(colorScheme, textTheme),
          unvisitedStyle,
        );
      });
    });
  });
}
