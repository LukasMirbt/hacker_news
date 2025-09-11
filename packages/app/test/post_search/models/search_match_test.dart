import 'package:app/post_search/post_search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(SearchMatch, () {
    SearchMatch createSubject({
      int? start,
      int? end,
      bool? isStartOfText,
      bool? isEndOfText,
    }) {
      return SearchMatch(
        start: start ?? 1,
        end: end ?? 1,
        isStartOfText: isStartOfText ?? false,
        isEndOfText: isEndOfText ?? false,
      );
    }

    group('length', () {
      test('returns correct value', () {
        final match = createSubject(start: 2, end: 4);
        expect(match.length, 2);
      });
    });

    group('contains', () {
      const start = 2;
      const end = 4;

      test('returns false when index < start', () {
        final match = createSubject(start: start, end: end);
        expect(match.contains(start - 1), false);
      });

      test('returns true when index == start', () {
        final match = createSubject(start: start, end: end);
        expect(match.contains(start), true);
      });

      test('returns true when index is within range', () {
        final match = createSubject(start: start, end: end);
        expect(match.contains(3), true);
      });

      test('returns false when index == end', () {
        final match = createSubject(start: start, end: end);
        expect(match.contains(end), false);
      });

      test('returns false when index > end', () {
        final match = createSubject(start: start, end: end);
        expect(match.contains(end + 1), false);
      });
    });
  });
}
