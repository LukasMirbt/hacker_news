import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockColorScheme extends Mock
    with Diagnosticable
    implements ColorScheme {}

void main() {
  group(AppOtherUserCommentData, () {
    late ColorScheme colorScheme;

    setUp(() {
      colorScheme = _MockColorScheme();
    });

    AppOtherUserCommentData createSubject({bool? hasBeenUpvoted}) {
      return AppOtherUserCommentData(
        isExpanded: false,
        onHeaderPressed: () {},
        user: '',
        age: '',
        hasBeenUpvoted: hasBeenUpvoted ?? false,
        htmlText: '',
        onMorePressed: () {},
        onLinkPressed: (_) {},
        onVotePressed: () {},
      );
    }

    group('voteIconColor', () {
      test('returns correct value when hasBeenUpvoted', () {
        const color = Colors.red;
        when(() => colorScheme.onSurface).thenReturn(color);
        final data = createSubject(
          hasBeenUpvoted: true,
        );
        expect(
          data.voteIconColor(colorScheme),
          color,
        );
      });

      test('returns correct value when !hasBeenUpvoted', () {
        const color = Colors.blue;
        when(() => colorScheme.onSurfaceVariant).thenReturn(color);
        final data = createSubject();
        expect(
          data.voteIconColor(colorScheme),
          color,
        );
      });
    });

    group('voteIconSize', () {
      test('returns correct value when hasBeenUpvoted', () {
        final data = createSubject(
          hasBeenUpvoted: true,
        );
        expect(data.voteIconSize, 20);
      });

      test('returns correct value when !hasBeenUpvoted', () {
        final data = createSubject();
        expect(data.voteIconSize, 18);
      });
    });
  });
}
