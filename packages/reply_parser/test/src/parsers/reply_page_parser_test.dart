// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_parser/reply_parser.dart';

class _MockReplyCommentDataParser extends Mock implements ReplyParentParser {}

class _MockReplyFormDataParser extends Mock implements ReplyFormParser {}

class _MockElement extends Mock implements Element {}

void main() {
  final parentData = ReplyParentDataPlaceholder();
  const formData = ReplyFormDataPlaceholder();

  group(ReplyPageParser, () {
    late ReplyParentParser parentParser;
    late ReplyFormParser formParser;
    late Element fatItem;
    late Element athing;

    setUp(() {
      parentParser = _MockReplyCommentDataParser();
      formParser = _MockReplyFormDataParser();
      fatItem = _MockElement();
      athing = _MockElement();
    });

    ReplyPageParser createSubject() {
      return ReplyPageParser(
        replyParentParser: parentParser,
        replyFormParser: formParser,
      );
    }

    group('parse', () {
      final athingSelector = () => fatItem.querySelector('.athing');
      final parseCommentData = () => parentParser.parse(athing);
      final parseFormData = () => formParser.parse(fatItem);

      test('returns $ReplyPageData with correct values '
          'when data is non-null', () {
        when(athingSelector).thenReturn(athing);
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
        verify(parseCommentData).called(1);
        verify(parseFormData).called(1);
      });

      test('returns $ReplyPageData with correct values '
          'when data is null', () {
        when(parseFormData).thenReturn(formData);
        final parser = createSubject();
        expect(
          parser.parse(fatItem),
          ReplyPageData(
            parentData: ReplyParentData.empty,
            formData: formData,
          ),
        );
        verify(athingSelector).called(1);
        verify(parseFormData).called(1);
      });
    });
  });
}
