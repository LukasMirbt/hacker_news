// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockSearchResultModel extends Mock implements SearchResultModel {}

class _MockSearchResultSnippet extends Mock implements SearchResultSnippet {}

class _MockSearchMatch extends Mock implements SearchMatch {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  final characters = ['a', 'b', 'c'];

  group(SearchResultText, () {
    late SearchResultModel item;
    late SearchResultSnippet snippet;
    late SearchMatch match;

    setUp(() {
      item = _MockSearchResultModel();
      snippet = _MockSearchResultSnippet();
      match = _MockSearchMatch();
      when(() => item.snippet).thenReturn(snippet);
      when(() => snippet.match).thenReturn(match);
      when(() => match.isStartOfText).thenReturn(true);
      when(() => match.isEndOfText).thenReturn(true);
      when(() => snippet.characters).thenReturn(characters);
      when(() => match.contains(any())).thenReturn(false);
    });

    Widget buildSubject() {
      return Provider.value(
        value: item,
        child: SearchResultText(),
      );
    }

    group(Text, () {
      Text findWidget(WidgetTester tester) {
        return tester.widget<Text>(
          find.byType(Text),
        );
      }

      TextTheme findTextTheme(WidgetTester tester) {
        final context = tester.element(
          find.byType(Text),
        );
        return TextTheme.of(context);
      }

      testWidgets('renders start ellipsis '
          'when !isStartOfText', (tester) async {
        when(() => match.isStartOfText).thenReturn(false);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        final rootSpan = widget.textSpan! as TextSpan;
        expect(
          rootSpan.children!.first,
          isA<TextSpan>().having(
            (span) => span.text,
            'text',
            l10n.postSearch_startEllipsis,
          ),
        );
      });

      testWidgets('renders each character in snippet '
          'with correct style', (tester) async {
        when(() => match.contains(1)).thenReturn(true);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        final textTheme = findTextTheme(tester);
        final regularStyle = textTheme.bodyMedium;
        final highlightedStyle = regularStyle?.copyWithWeight(
          (weight) => weight * 1.75,
        );
        final rootSpan = widget.textSpan! as TextSpan;
        expect(
          rootSpan.children,
          [
            isA<TextSpan>()
                .having(
                  (span) => span.text,
                  'text',
                  characters[0],
                )
                .having(
                  (span) => span.style,
                  'fontWeight',
                  regularStyle,
                ),
            isA<TextSpan>()
                .having(
                  (span) => span.text,
                  'text',
                  characters[1],
                )
                .having(
                  (span) => span.style,
                  'fontWeight',
                  highlightedStyle,
                ),
            isA<TextSpan>()
                .having(
                  (span) => span.text,
                  'text',
                  characters[2],
                )
                .having(
                  (span) => span.style,
                  'fontWeight',
                  regularStyle,
                ),
          ],
        );
      });

      testWidgets('renders end ellipsis '
          'when !isEndOfText', (tester) async {
        when(() => match.isEndOfText).thenReturn(false);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        final rootSpan = widget.textSpan! as TextSpan;
        expect(
          rootSpan.children!.last,
          isA<TextSpan>().having(
            (span) => span.text,
            'text',
            l10n.postSearch_endEllipsis,
          ),
        );
      });
    });
  });
}
