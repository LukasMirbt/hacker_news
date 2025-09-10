// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockCommentListState extends Mock implements CommentListState {}

class _MockOtherUserCommentModel extends Mock
    implements OtherUserCommentModel {}

void main() {
  final child = Container();

  group(CommentBackground, () {
    late CommentListBloc bloc;
    late CommentListState state;
    late CommentModel comment;

    setUp(() {
      bloc = _MockCommentListBloc();
      state = _MockCommentListState();
      comment = _MockOtherUserCommentModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.isSelected(comment)).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: Provider.value(
          value: comment,
          child: CommentBackground(
            child: child,
          ),
        ),
      );
    }

    Material findWidget(WidgetTester tester) {
      return tester.widget<Material>(
        find.descendant(
          of: find.byType(CommentBackground),
          matching: find.byType(Material),
        ),
      );
    }

    ExtendedColorScheme findColorScheme(WidgetTester tester) {
      final context = tester.element(
        find.byType(CommentBackground),
      );
      return ExtendedColorScheme.of(context);
    }

    testWidgets('renders $Material with correct color '
        'when isSelected', (tester) async {
      when(() => state.isSelected(comment)).thenReturn(true);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      final colorScheme = findColorScheme(tester);
      expect(widget.color, colorScheme.highlight);
    });

    testWidgets('renders $Material with correct color '
        'when !isSelected', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.color, null);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
