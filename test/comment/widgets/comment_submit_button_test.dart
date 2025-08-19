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

class _MockCommentFormModel extends Mock implements CommentFormModel {}

void main() {
  group(CommentSubmitButton, () {
    late CommentBloc bloc;
    late CommentState state;
    late CommentFormModel form;

    setUp(() {
      bloc = _MockCommentBloc();
      state = _MockCommentState();
      form = _MockCommentFormModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.form).thenReturn(form);
      when(() => form.isSubmissionLoading).thenReturn(false);
      when(() => form.isValid).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentSubmitButton(),
      );
    }

    group(AppFilledButton, () {
      AppFilledButton findWidget(WidgetTester tester) {
        return tester.widget<AppFilledButton>(
          find.byType(AppFilledButton),
        );
      }

      group('isLoading', () {
        testWidgets('is true when form.isSubmissionLoading', (tester) async {
          when(() => form.isSubmissionLoading).thenReturn(true);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, true);
        });

        testWidgets('is false when !form.isSubmissionLoading', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, false);
        });
      });

      group('onPressed', () {
        testWidgets('adds $CommentSubmitted when isValid', (tester) async {
          when(() => form.isValid).thenReturn(true);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          widget.onPressed?.call();
          verify(
            () => bloc.add(CommentSubmitted()),
          ).called(1);
        });

        testWidgets('does not add $CommentSubmitted '
            'when !isValid', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          widget.onPressed?.call();
          verifyNever(
            () => bloc.add(CommentSubmitted()),
          );
        });
      });
    });
  });
}
