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

class _MockCommentState extends Mock implements CommentState {}

void main() {
  group(AddCommentButton, () {
    late CommentBloc bloc;
    late CommentState state;

    setUp(() {
      bloc = _MockCommentBloc();
      state = _MockCommentState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.isLoading).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AddCommentButton(),
      );
    }

    group(AppFilledButton, () {
      AppFilledButton findWidget(WidgetTester tester) {
        return tester.widget<AppFilledButton>(
          find.byType(AppFilledButton),
        );
      }

      group('isLoading', () {
        testWidgets('is true when state.isLoading', (tester) async {
          when(() => state.isLoading).thenReturn(true);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, true);
        });

        testWidgets('is false when !state.isLoading', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, false);
        });
      });

      testWidgets('adds $CommentSubmitted onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onPressed?.call();
        verify(() => bloc.add(CommentSubmitted()));
      });
    });
  });
}
