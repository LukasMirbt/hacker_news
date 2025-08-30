// ignore_for_file: prefer_function_declarations_over_variables

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPostTitleRowParser extends Mock implements PostTitleRowParser {}

class _MockJobTitleRowParser extends Mock implements JobTitleRowParser {}

class _MockSubtitleRowParser extends Mock implements SubtitleRowParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const postTitleRowData = PostTitleRowDataPlaceholder();
  const jobTitleRowData = JobTitleRowDataPlaceholder();
  final postSubtitleRowData = PostSubtitleRowDataPlaceholder();
  final jobSubtitleRowData = JobSubtitleRowDataPlaceholder();

  group(FeedItemParser, () {
    late PostTitleRowParser postTitleRowParser;
    late JobTitleRowParser jobTitleRowParser;
    late SubtitleRowParser subtitleRowParser;
    late Element athing;
    late Element subtitleRow;

    setUp(() {
      postTitleRowParser = _MockPostTitleRowParser();
      jobTitleRowParser = _MockJobTitleRowParser();
      subtitleRowParser = _MockSubtitleRowParser();
      athing = _MockElement();
      subtitleRow = _MockElement();
    });

    FeedItemParser createSubject() {
      return FeedItemParser(
        postTitleRowParser: postTitleRowParser,
        jobTitleRowParser: jobTitleRowParser,
        subtitleRowParser: subtitleRowParser,
      );
    }

    group('parse', () {
      final parsePostTitleRowData = () => postTitleRowParser.parse(athing);
      final parseJobTitleRowData = () => jobTitleRowParser.parse(athing);
      final parseSubtitleRowData = () => subtitleRowParser.parse(subtitleRow);

      test('returns $PostFeedItemData with correct values '
          'when nextElementSibling is null', () {
        when(parsePostTitleRowData).thenReturn(postTitleRowData);
        final parser = createSubject();
        expect(
          parser.parse(athing),
          PostFeedItemData(
            titleRowData: postTitleRowData,
            subtitleRowData: PostSubtitleRowData.empty,
          ),
        );
        verify(parsePostTitleRowData).called(1);
      });

      test('returns $PostFeedItemData with correct values '
          'when nextElementSibling is non-null '
          'and subtitleRowData is $PostSubtitleRowData', () {
        when(() => athing.nextElementSibling).thenReturn(subtitleRow);
        when(parseSubtitleRowData).thenReturn(postSubtitleRowData);
        when(parsePostTitleRowData).thenReturn(postTitleRowData);
        final parser = createSubject();
        expect(
          parser.parse(athing),
          PostFeedItemData(
            titleRowData: postTitleRowData,
            subtitleRowData: postSubtitleRowData,
          ),
        );
        verify(parseSubtitleRowData).called(1);
        verify(parsePostTitleRowData).called(1);
      });

      test('returns $JobFeedItemData with correct values '
          'when nextElementSibling is non-null '
          'and subtitleRowData is $JobSubtitleRowData', () {
        when(() => athing.nextElementSibling).thenReturn(subtitleRow);
        when(parseSubtitleRowData).thenReturn(jobSubtitleRowData);
        when(parseJobTitleRowData).thenReturn(jobTitleRowData);
        final parser = createSubject();
        expect(
          parser.parse(athing),
          JobFeedItemData(
            titleRowData: jobTitleRowData,
            subtitleRowData: jobSubtitleRowData,
          ),
        );
        verify(parseSubtitleRowData).called(1);
        verify(parseJobTitleRowData).called(1);
      });
    });
  });
}
