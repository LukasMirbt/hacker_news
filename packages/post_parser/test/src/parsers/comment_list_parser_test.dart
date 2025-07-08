// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_parser/post_parser.dart';

class _MockCommentParser extends Mock implements CommentParser {}

class _MockElement extends Mock implements Element {}

class _MockCommentData extends Mock implements CommentData {}

void main() {
  group(CommentListParser, () {
    late CommentParser commentParser;
    late Element element;

    setUp(() {
      commentParser = _MockCommentParser();
      element = _MockElement();
    });

    CommentListParser createSubject() {
      return CommentListParser(
        commentParser: commentParser,
      );
    }

    group('parse', () {
      final commentElement = _MockElement();
      final commentElements = [commentElement];

      final comment = _MockCommentData();
      final commentList = [comment];

      final querySelectorAll = () => element.querySelectorAll('.athing.comtr');

      final parseComment = () => commentParser.parse(commentElement);

      test('calls querySelectorAll, parses each element '
          'and returns ${CommentData}s', () {
        when(querySelectorAll).thenReturn(commentElements);
        when(parseComment).thenReturn(comment);
        final parser = createSubject();
        expect(parser.parse(element), commentList);
        verify(querySelectorAll).called(1);
        verify(parseComment).called(commentElements.length);
      });
    });
  });
}
