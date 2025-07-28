// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

class _MockReplyState extends Mock implements ReplyState {}

class _MockReplyParentModel extends Mock implements ReplyParentModel {}

void main() {
  group(ReplyDivider, () {
    late ReplyBloc bloc;
    late ReplyState state;
    late ReplyParentModel parent;

    setUp(() {
      bloc = _MockReplyBloc();
      state = _MockReplyState();
      parent = _MockReplyParentModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.parent).thenReturn(parent);
      when(() => parent.isExpanded).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyDivider(),
      );
    }

    Padding findPadding(WidgetTester tester) {
      return tester.widget<Padding>(
        find.ancestor(
          of: find.byType(Divider),
          matching: find.byType(Padding),
        ),
      );
    }

    testWidgets('renders $Divider', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('has correct padding when parent.isExpanded', (tester) async {
      when(() => parent.isExpanded).thenReturn(true);
      await tester.pumpApp(buildSubject());
      final padding = findPadding(tester);
      expect(
        padding.padding,
        EdgeInsets.only(
          top: AppSpacing.lg,
          bottom: AppSpacing.lg,
        ),
      );
    });

    testWidgets('has correct padding when !parent.isExpanded', (tester) async {
      await tester.pumpApp(buildSubject());
      final padding = findPadding(tester);
      expect(
        padding.padding,
        EdgeInsets.only(
          top: AppSpacing.xs,
          bottom: AppSpacing.lg,
        ),
      );
    });
  });
}
