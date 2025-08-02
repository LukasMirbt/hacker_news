// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_parser/reply_parser.dart';

class _MockReplyCommentDataParser extends Mock implements ReplyParentParser {}

class _MockReplyFormParser extends Mock implements ReplyFormParser {}

class _MockElement extends Mock implements Element {}

void main() {
  final parentData = OtherUserReplyParentDataPlaceholder();
  const formData = ReplyFormDataPlaceholder();

  group(ReplyPageParser, () {
    late ReplyParentParser parentParser;
    late ReplyFormParser formParser;
    late Element fatItem;
    late Element athing;
    late Element form;

    setUp(() {
      parentParser = _MockReplyCommentDataParser();
      formParser = _MockReplyFormParser();
      fatItem = _MockElement();
      athing = _MockElement();
      form = _MockElement();
    });

    ReplyPageParser createSubject() {
      return ReplyPageParser(
        replyParentParser: parentParser,
        replyFormParser: formParser,
      );
    }

    group('parse', () {
      final athingSelector = () => fatItem.querySelector('.athing');
      final formSelector = () =>
          fatItem.querySelector('form[action="comment"]');
      final parseCommentData = () => parentParser.parse(athing);
      final parseFormData = () => formParser.parse(form);

      test('returns $ReplyPageData with correct values '
          'when data is non-null', () {
        when(athingSelector).thenReturn(athing);
        when(formSelector).thenReturn(form);
        when(parseCommentData).thenReturn(parentData);
        when(parseFormData).thenReturn(formData);
        final parser = createSubject();
        expect(
          parser.parse(fatItem),
          ReplyPageData(
            parentData: parentData,
            formData: formData,
          ),
        );
        verify(athingSelector).called(1);
        verify(formSelector).called(1);
        verify(parseCommentData).called(1);
        verify(parseFormData).called(1);
      });

      test('returns $ReplyPageData with correct values '
          'when data is null', () {
        final parser = createSubject();
        expect(
          parser.parse(fatItem),
          ReplyPageData(
            parentData: OtherUserReplyParentData.empty,
            formData: null,
          ),
        );
        verify(athingSelector).called(1);
        verify(formSelector).called(1);
      });
    });
  });
}
