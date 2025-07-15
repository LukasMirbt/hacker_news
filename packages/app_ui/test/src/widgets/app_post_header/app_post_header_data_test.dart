import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockColorScheme extends Mock
    with Diagnosticable
    implements ColorScheme {}

void main() {
  group(AppPostHeaderData, () {
    late ColorScheme colorScheme;

    setUp(() {
      colorScheme = _MockColorScheme();
    });

    AppPostHeaderData createSubject({bool? hasBeenVisited}) {
      return AppPostHeaderData(
        hasBeenVisited: hasBeenVisited ?? false,
        title: '',
        age: '',
        urlHost: null,
        user: null,
        htmlText: '',
        onPressed: () {},
        onTextLinkPressed: (_) {},
        onSharePressed: () {},
        voteButton: null,
        commentButton: null,
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
