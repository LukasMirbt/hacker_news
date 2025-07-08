// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockCommentFormBloc extends MockBloc<CommentFormEvent, CommentFormState>
    implements CommentFormBloc {}

void main() {
  group(CommentFormTextField, () {
    late CommentFormBloc bloc;

    setUp(() {
      bloc = _MockCommentFormBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentFormTextField(),
      );
    }

    group(TextField, () {
      TextField findWidget(WidgetTester tester) {
        return tester.widget<TextField>(
          find.byType(TextField),
        );
      }

      testWidgets('has correct minLines', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.minLines, 5);
      });

      testWidgets('has correct maxLines', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.maxLines, null);
      });

      testWidgets('adds $CommentFormTextChanged onChanged', (tester) async {
        const text = 'text';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onChanged?.call(text);
        verify(
          () => bloc.add(
            CommentFormTextChanged(text),
          ),
        ).called(1);
      });
    });
  });
}
