// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/drafts/drafts.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:text_parser/text_parser.dart';

class _MockReplyDraft extends Mock implements ReplyDraft {}

class _MockTextParser extends Mock implements TextParser {}

void main() {
  group(ReplyDraftModel, () {
    late ReplyDraft draft;
    late TextParser textParser;

    setUp(() {
      draft = _MockReplyDraft();
      textParser = _MockTextParser();
    });

    ReplyDraftModel createSubject() {
      return ReplyDraftModel(
        draft: draft,
        textParser: textParser,
      );
    }

    group('url', () {
      test('returns draft.url', () {
        const url = 'url';
        when(() => draft.url).thenReturn(url);
        final model = createSubject();
        expect(model.url, url);
      });
    });

    group('title', () {
      test('returns draft.content', () {
        const content = 'content';
        when(() => draft.content).thenReturn(content);
        final model = createSubject();
        expect(model.title, content);
      });
    });

    group('subtitle', () {
      test('returns correct value', () {
        const parentHtmlText = 'parentHtmlText';
        const subtitle = 'subtitle';
        final parseText = () => textParser.parse(parentHtmlText);
        when(() => draft.parentHtmlText).thenReturn(parentHtmlText);
        when(parseText).thenReturn(subtitle);
        final model = createSubject();
        expect(model.subtitle, subtitle);
        verify(parseText).called(1);
      });
    });

    group('toRepository', () {
      test('returns draft', () {
        final model = createSubject();
        expect(model.toRepository(), draft);
      });
    });
  });
}
