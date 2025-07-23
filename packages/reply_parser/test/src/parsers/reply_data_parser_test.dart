// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_parser/reply_parser.dart';

class _MockReplyCommentDataParser extends Mock
    implements ReplyCommentDataParser {}

class _MockReplyFormDataParser extends Mock implements ReplyFormDataParser {}

class _MockElement extends Mock implements Element {}

void main() {
  final commentData = ReplyCommentDataPlaceholder();
  const formData = ReplyFormDataPlaceholder();

  group(ReplyDataParser, () {
    late ReplyCommentDataParser commentDataParser;
    late ReplyFormDataParser formDataParser;
    late Element fatItem;
    late Element athing;

    setUp(() {
      commentDataParser = _MockReplyCommentDataParser();
      formDataParser = _MockReplyFormDataParser();
      fatItem = _MockElement();
      athing = _MockElement();
    });

    ReplyDataParser createSubject() {
      return ReplyDataParser(
        replyCommentDataParser: commentDataParser,
        replyFormDataParser: formDataParser,
      );
    }

    group('parse', () {
      final athingSelector = () => fatItem.querySelector('.athing');
      final parseCommentData = () => commentDataParser.parse(athing);
      final parseFormData = () => formDataParser.parse(fatItem);

      test('returns $ReplyData with correct values '
          'when data is non-null', () {
        when(athingSelector).thenReturn(athing);
        when(parseCommentData).thenReturn(commentData);
        when(parseFormData).thenReturn(formData);
        final parser = createSubject();
        expect(
          parser.parse(fatItem),
          ReplyData(
            commentData: commentData,
            formData: formData,
          ),
        );
        verify(athingSelector).called(1);
        verify(parseCommentData).called(1);
        verify(parseFormData).called(1);
      });

      test('returns $ReplyData with correct values '
          'when data is null', () {
        when(parseFormData).thenReturn(formData);
        final parser = createSubject();
        expect(
          parser.parse(fatItem),
          ReplyData(
            commentData: ReplyCommentData.empty,
            formData: formData,
          ),
        );
        verify(athingSelector).called(1);
        verify(parseFormData).called(1);
      });
    });
  });
}
