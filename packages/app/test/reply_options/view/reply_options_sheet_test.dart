// ignore_for_file: prefer_const_constructors

import 'package:app/reply_options/reply_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

import '../../app/pump_app.dart';

class _MockReplyOptionsBloc
    extends MockBloc<ReplyOptionsEvent, ReplyOptionsState>
    implements ReplyOptionsBloc {}

void main() {
  final parent = OtherUserReplyParentPlaceholder();

  group(ReplyOptionsSheet, () {
    late ReplyOptionsBloc bloc;

    setUp(() {
      bloc = _MockReplyOptionsBloc();
      when(() => bloc.state).thenReturn(
        ReplyOptionsState.from(parent: parent),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyOptionsSheet(),
      );
    }

    group('show', () {
      testWidgets('renders $ReplyOptionsSheet', (tester) async {
        await tester.pumpAppWithContext(
          (context) => ReplyOptionsSheet.show(
            context: context,
            parent: parent,
          ),
        );
        expect(
          find.byType(ReplyOptionsSheet),
          findsOneWidget,
        );
      });
    });

    testWidgets('renders $AppBottomSheet', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBottomSheet), findsOneWidget);
    });

    testWidgets('renders $ShareOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ShareOption), findsOneWidget);
    });

    testWidgets('renders $OpenOnWebOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(OpenOnWebOption), findsOneWidget);
    });
  });
}
