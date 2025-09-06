// ignore_for_file: prefer_function_declarations_over_variables

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAgeParser extends Mock implements AgeParser {}

class _MockScoreParser extends Mock implements ScoreParser {}

class _MockHnuserParser extends Mock implements HnuserParser {}

class _MockCommentCountParser extends Mock implements CommentCountParser {}

class _MockElement extends Mock implements Element {}

void main() {
  final age = DateTime(1);
  const score = 1;
  const hnuser = HnuserPlaceholder();
  const commentCount = 1;

  group(SubtitleRowParser, () {
    late AgeParser ageParser;
    late ScoreParser scoreParser;
    late HnuserParser hnuserParser;
    late CommentCountParser commentCountParser;
    late Element subtitleRow;

    setUp(() {
      ageParser = _MockAgeParser();
      scoreParser = _MockScoreParser();
      hnuserParser = _MockHnuserParser();
      commentCountParser = _MockCommentCountParser();
      subtitleRow = _MockElement();
    });

    SubtitleRowParser createSubject() {
      return SubtitleRowParser(
        ageParser: ageParser,
        scoreParser: scoreParser,
        hnuserParser: hnuserParser,
        commentCountParser: commentCountParser,
      );
    }

    group('parse', () {
      final parseAge = () => ageParser.parse(subtitleRow);
      final parseScore = () => scoreParser.parse(subtitleRow);
      final parseHnuser = () => hnuserParser.parse(subtitleRow);
      final parseCommentCount = () => commentCountParser.parse(subtitleRow);

      test('calls parsers and returns $PostSubtitleRowData '
          'when hnuser is non-null', () {
        when(parseAge).thenReturn(age);
        when(parseHnuser).thenReturn(hnuser);
        when(parseScore).thenReturn(score);
        when(parseCommentCount).thenReturn(commentCount);
        final parser = createSubject();
        expect(
          parser.parse(subtitleRow),
          PostSubtitleRowData.fromParsed(
            age: age,
            score: score,
            hnuser: hnuser,
            commentCount: commentCount,
          ),
        );
        verify(parseAge).called(1);
        verify(parseScore).called(1);
        verify(parseHnuser).called(1);
        verify(parseCommentCount).called(1);
      });

      test('calls parsers and returns $JobSubtitleRowData '
          'when hnuser is null', () {
        when(parseAge).thenReturn(age);
        final parser = createSubject();
        expect(
          parser.parse(subtitleRow),
          JobSubtitleRowData.fromParsed(age: age),
        );
        verify(parseAge).called(1);
        verify(parseHnuser).called(1);
      });
    });
  });
}
