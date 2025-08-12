// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const text = 'text';

  final initialState = CommentState(
    fetchStatus: FetchStatus.loading,
    header: CommentPostHeaderModel(
      PostHeaderPlaceholder(),
    ),
    form: CommentFormModel(
      text: text,
      form: CommentFormPlaceholder(),
    ),
  );

  group(CommentTextField, () {
    late CommentBloc bloc;

    setUp(() {
      bloc = _MockCommentBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentTextField(),
      );
    }

    group(TextField, () {
      TextField findWidget(WidgetTester tester) {
        return tester.widget<TextField>(
          find.byType(TextField),
        );
      }

      testWidgets('initial text is form.text', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.controller?.text, text);
      });

      testWidgets('updates controller when form.text changes '
          'to a different value than controller.text', (tester) async {
        const updatedText = 'updatedText';
        whenListen(
          bloc,
          initialState: initialState,
          Stream.value(
            initialState.copyWith(
              form: initialState.form.copyWith(
                text: updatedText,
              ),
            ),
          ),
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.controller?.text,
          updatedText,
        );
      });

      testWidgets('does not update controller when form.text changes '
          'to the same value as controller.text', (tester) async {
        final completer = Completer<CommentState>();

        const updatedText = 'updatedText';

        final selection = TextSelection.fromPosition(
          TextPosition(offset: 0),
        );

        whenListen(
          bloc,
          Stream.fromFuture(completer.future),
          initialState: initialState,
        );

        await tester.pumpApp(buildSubject());

        final widget = findWidget(tester);

        final controller = widget.controller!
          ..text = updatedText
          ..selection = selection;

        completer.complete(
          initialState.copyWith(
            form: initialState.form.copyWith(
              text: updatedText,
            ),
          ),
        );

        await tester.pump();

        expect(
          controller.selection,
          selection,
        );
      });

      testWidgets('autofocus is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.autofocus, true);
      });

      testWidgets('maxLines is null', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.maxLines, null);
      });

      testWidgets('has correct decoration', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.decoration,
          InputDecoration.collapsed(
            hintText: l10n.comment_textFieldHintText,
          ),
        );
      });

      testWidgets('adds $CommentTextChanged onChanged', (tester) async {
        const text = 'text';
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onChanged?.call(text);
        verify(
          () => bloc.add(
            CommentTextChanged(text),
          ),
        ).called(1);
      });
    });
  });
}
