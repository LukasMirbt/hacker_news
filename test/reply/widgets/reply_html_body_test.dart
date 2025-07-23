// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

void main() {
  const htmlText = 'htmlText';

  group(ReplyHtmlBody, () {
    late ReplyBloc bloc;

    setUp(() {
      bloc = _MockReplyBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyHtmlBody(
          htmlText: htmlText,
        ),
      );
    }

    group(AppHtmlWidget, () {
      AppHtmlWidget findWidget(WidgetTester tester) {
        return tester.widget<AppHtmlWidget>(
          find.byType(AppHtmlWidget),
        );
      }

      testWidgets('has correct html', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.html, htmlText);
      });

      testWidgets('adds $ReplyLinkPressed onLinkPressed', (tester) async {
        const url = 'url';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onLinkPressed(url);
        verify(
          () => bloc.add(
            ReplyLinkPressed(url),
          ),
        ).called(1);
      });
    });
  });
}
