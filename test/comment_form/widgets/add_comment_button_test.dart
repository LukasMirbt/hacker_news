// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockCommentFormBloc extends MockBloc<CommentFormEvent, CommentFormState>
    implements CommentFormBloc {}

class _MockCommentFormState extends Mock implements CommentFormState {}

void main() {
  group(AddCommentButton, () {
    late CommentFormBloc bloc;
    late CommentFormState state;

    setUp(() {
      bloc = _MockCommentFormBloc();
      state = _MockCommentFormState();
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

      testWidgets('adds $CommentFormSubmitted onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onPressed?.call();
        verify(() => bloc.add(CommentFormSubmitted()));
      });
    });
  });
}
