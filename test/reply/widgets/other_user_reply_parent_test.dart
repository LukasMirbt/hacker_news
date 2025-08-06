// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:hacker_client/reply_options/reply_options.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart'
    hide OtherUserReplyParent;

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

class _MockOtherUserReplyParentModel extends Mock
    implements OtherUserReplyParentModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  const isExpanded = true;
  const user = 'user';
  const age = 'age';
  const htmlText = 'htmlText';
  const hasBeenUpvoted = true;

  group(OtherUserReplyParent, () {
    late ReplyBloc bloc;
    late OtherUserReplyParentModel item;

    setUp(() {
      bloc = _MockReplyBloc();
      item = _MockOtherUserReplyParentModel();
      registerFallbackValue(_MockAppLocalizations());
      registerFallbackValue(_MockDateFormatterLocalizations());
      when(() => item.isExpanded).thenReturn(isExpanded);
      when(() => item.user).thenReturn(user);
      when(() => item.age(any(), any())).thenReturn(age);
      when(() => item.htmlText).thenReturn(htmlText);
      when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: OtherUserReplyParent(item),
      );
    }

    AppOtherUserComment findWidget(WidgetTester tester) {
      return tester.widget<AppOtherUserComment>(
        find.byType(AppOtherUserComment),
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

    testWidgets('has correct htmlText', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.htmlText, htmlText);
    });

    testWidgets('has correct hasBeenUpvoted', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.hasBeenUpvoted, hasBeenUpvoted);
    });

    testWidgets('adds $ReplyParentExpansionToggled '
        'onHeaderPressed', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.data.onHeaderPressed();
      verify(
        () => bloc.add(
          ReplyParentExpansionToggled(),
        ),
      );
    });

    testWidgets(
      'shows $ReplyOptionsSheet onMorePressed',
      (tester) async {
        when(item.toRepository).thenReturn(
          OtherUserReplyParentPlaceholder(),
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onMorePressed();
        await tester.pump();
        expect(
          find.byType(ReplyOptionsSheet),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'adds $ReplyLinkPressed onLinkPressed',
      (tester) async {
        const url = 'url';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onLinkPressed(url);
        verify(
          () => bloc.add(
            ReplyLinkPressed(url),
          ),
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
          () => bloc.add(
            ReplyParentVotePressed(item),
          ),
        ).called(1);
      },
    );
  });
}
