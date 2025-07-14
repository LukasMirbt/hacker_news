import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockColorScheme extends Mock
    with Diagnosticable
    implements ColorScheme {}

void main() {
  group(AppFeedItemData, () {
    late ColorScheme colorScheme;

    setUp(() {
      colorScheme = _MockColorScheme();
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
        voteButtonData: null,
        commentCountButtonData: null,
      );
    }

    group('titleColor', () {
      test('returns correct value when hasBeenVisited', () {
        const color = Colors.red;
        when(() => colorScheme.onSurfaceVariant).thenReturn(color);
        final data = createSubject(
          hasBeenVisited: true,
        );
        expect(data.titleColor(colorScheme), color);
      });

      test('returns correct value when !hasBeenVisited', () {
        const color = Colors.blue;
        when(() => colorScheme.onSurface).thenReturn(color);
        final data = createSubject();
        expect(data.titleColor(colorScheme), color);
      });
    });
  });
}
