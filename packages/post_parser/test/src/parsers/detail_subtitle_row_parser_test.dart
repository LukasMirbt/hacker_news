// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_parser/post_parser.dart';

class _MockScoreParser extends Mock implements ScoreParser {}

class _MockHnuserParser extends Mock implements HnuserParser {}

class _MockAgeParser extends Mock implements AgeParser {}

class _MockCommentCountParser extends Mock implements CommentCountParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const score = 1;
  const hnuser = HnuserPlaceholder();
  final age = DateTime(1);
  const commentCount = 1;

  group(DetailSubtitleRowParser, () {
    late Element subtext;
    late ScoreParser scoreParser;
    late HnuserParser hnuserParser;
    late AgeParser ageParser;
    late CommentCountParser commentCountParser;

    setUp(() {
      subtext = _MockElement();
      scoreParser = _MockScoreParser();
      hnuserParser = _MockHnuserParser();
      ageParser = _MockAgeParser();
      commentCountParser = _MockCommentCountParser();
    });

    DetailSubtitleRowParser createSubject() {
      return DetailSubtitleRowParser(
        scoreParser: scoreParser,
        hnuserParser: hnuserParser,
        ageParser: ageParser,
        commentCountParser: commentCountParser,
      );
    }

    group('parse', () {
      final parseScore = () => scoreParser.parse(subtext);
      final parseHnuser = () => hnuserParser.parse(subtext);
      final parseAge = () => ageParser.parse(subtext);
      final parseCommentCount = () => commentCountParser.parse(subtext);

      test('calls parsers and returns $DetailSubtitleRowData', () {
        when(parseScore).thenReturn(score);
        when(parseHnuser).thenReturn(hnuser);
        when(parseAge).thenReturn(age);
        when(parseCommentCount).thenReturn(commentCount);
        final parser = createSubject();
        expect(
          parser.parse(subtext),
          DetailSubtitleRowData.fromParsed(
            score: score,
            hnuser: hnuser,
            age: age,
            commentCount: commentCount,
          ),
        );
        verify(parseScore).called(1);
        verify(parseHnuser).called(1);
        verify(parseAge).called(1);
        verify(parseCommentCount).called(1);
      });
    });
  });
}
