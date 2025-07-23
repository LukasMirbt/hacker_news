// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

void main() {
  const htmlText = 'htmlText';

  group(CommentHtmlBody, () {
    late CommentBloc bloc;

    setUp(() {
      bloc = _MockCommentBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentHtmlBody(
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

      testWidgets('adds $CommentLinkPressed onLinkPressed', (tester) async {
        const url = 'url';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onLinkPressed(url);
        verify(
          () => bloc.add(
            CommentLinkPressed(url),
          ),
        ).called(1);
      });
    });
  });
}
