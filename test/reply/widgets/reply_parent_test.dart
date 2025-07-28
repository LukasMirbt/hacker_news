// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

class _MockReplyState extends Mock implements ReplyState {}

class _MockReplyParentModel extends Mock implements ReplyParentModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  const isExpanded = true;
  const user = 'user';
  const age = 'age';
  const hasBeenUpvoted = true;
  const htmlText = 'htmlText';

  group(ReplyParent, () {
    late ReplyBloc bloc;
    late ReplyState state;
    late ReplyParentModel parent;

    setUp(() {
      bloc = _MockReplyBloc();
      state = _MockReplyState();
      parent = _MockReplyParentModel();
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => bloc.state).thenReturn(state);
      when(() => state.parent).thenReturn(parent);
      when(() => parent.isExpanded).thenReturn(isExpanded);
      when(() => parent.user).thenReturn(user);
      when(() => parent.age(any(), any())).thenReturn(age);
      when(() => parent.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
      when(() => parent.htmlText).thenReturn(htmlText);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyParent(),
      );
    }

    AppComment findWidget(WidgetTester tester) {
      return tester.widget<AppComment>(
        find.byType(AppComment),
      );
    }

    testWidgets('has correct isExpanded', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.isExpanded, isExpanded);
    });

    testWidgets('has correct user', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.user, user);
    });

    testWidgets('has correct age', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.age, age);
    });

    testWidgets('has correct hasBeenUpvoted', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.hasBeenUpvoted, hasBeenUpvoted);
    });

    testWidgets('has correct htmlText', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.htmlText, htmlText);
    });

    testWidgets('adds $ReplyParentExpansionToggled '
        'onHeaderPressed', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.data.onHeaderPressed();
      verify(
        () => bloc.add(ReplyParentExpansionToggled()),
      );
    });

    /*     testWidgets(
      'shows $ReplyOptionsSheet onMorePressed',
      (tester) async {
        await tester.pumpApp(
          buildSubject(
            CommentModel(
              comment: CommentPlaceholder(),
            ),
          ),
        );
        final widget = findWidget(tester);
        widget.data.onMorePressed();
        await tester.pump();
        expect(
          find.byType(ReplyOptionsSheet),
          findsOneWidget,
        );
      },
    ); */

    testWidgets(
      'adds $ReplyLinkPressed onLinkPressed',
      (tester) async {
        const url = 'url';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onLinkPressed(url);
        verify(
          () => bloc.add(ReplyLinkPressed(url)),
        ).called(1);
      },
    );

    testWidgets(
      'adds $ReplyParentVotePressed onVotePressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onVotePressed();
        verify(
          () => bloc.add(ReplyParentVotePressed()),
        ).called(1);
      },
    );
  });
}
