// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_parser/thread_parser.dart';

class _MockThreadCommentParser extends Mock implements ThreadCommentParser {}

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

class _MockThreadCommentData extends Mock implements ThreadCommentData {}

void main() {
  group(ThreadCommentListParser, () {
    late ThreadCommentParser commentParser;
    late Document document;

    setUp(() {
      commentParser = _MockThreadCommentParser();
      document = _MockDocument();
    });

    ThreadCommentListParser createSubject() {
      return ThreadCommentListParser(
        threadCommentParser: commentParser,
      );
    }

    group('parse', () {
      final commentElement = _MockElement();
      final commentElements = [commentElement];

      final comment = _MockThreadCommentData();
      final commentList = [comment];

      final querySelectorAll = () => document.querySelectorAll('.athing.comtr');

      final parseComment = () => commentParser.parse(commentElement);

      test('calls querySelectorAll, parses each element '
          'and returns ${ThreadCommentData}s', () {
        when(querySelectorAll).thenReturn(commentElements);
        when(parseComment).thenReturn(comment);
        final parser = createSubject();
        expect(parser.parse(document), commentList);
        verify(querySelectorAll).called(1);
        verify(parseComment).called(commentElements.length);
      });
    });
  });
}
