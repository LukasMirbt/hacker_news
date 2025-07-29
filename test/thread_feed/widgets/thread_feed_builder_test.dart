// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart' hide ThreadComment;

import '../../app/pump_app.dart';

class _MockThreadFeedBloc extends MockBloc<ThreadFeedEvent, ThreadFeedState>
    implements ThreadFeedBloc {}

class _MockPaginatedThreadFeedModel extends Mock
    implements PaginatedThreadFeedModel {}

void main() {
  final initialState = ThreadFeedState.initial();

  final comment = OtherUserThreadCommentModel(
    comment: OtherUserThreadCommentPlaceholder(),
  );

  group(ThreadFeedBuilder, () {
    late ThreadFeedBloc bloc;
    late PaginatedThreadFeedModel feed;

    setUp(() {
      bloc = _MockThreadFeedBloc();
      feed = _MockPaginatedThreadFeedModel();
      when(() => bloc.state).thenReturn(
        initialState.copyWith(feed: feed),
      );
    });

    ThreadFeedBuilder createSubject() => ThreadFeedBuilder();

    Widget buildSubject(
      Widget Function(BuildContext) builder,
    ) {
      return BlocProvider.value(
        value: bloc,
        child: Builder(builder: builder),
      );
    }

    group('padding', () {
      test('returns correct value when hasReachedMax', () {
        final builder = createSubject();
        expect(
          builder.padding(hasReachedMax: true),
          EdgeInsets.only(bottom: 24),
        );
      });

      test('returns correct value when !hasReachedMax', () {
        final builder = createSubject();
        expect(
          builder.padding(hasReachedMax: false),
          EdgeInsets.zero,
        );
      });
    });

    group('itemBuilder', () {
      testWidgets('renders $ThreadComment', (tester) async {
        final visibleItems = [comment];
        when(() => feed.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();

        await tester.pumpApp(
          buildSubject(
            (context) => builder.itemBuilder(context, 0),
          ),
        );

        expect(find.byType(ThreadComment), findsOneWidget);
      });

      testWidgets('does not render $ThreadFeedFooter '
          'when !isLast', (tester) async {
        final visibleItems = [comment, comment];
        when(() => feed.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();

        await tester.pumpApp(
          buildSubject(
            (context) => builder.itemBuilder(context, 0),
          ),
        );

        expect(find.byType(ThreadFeedFooter), findsNothing);
      });

      testWidgets('renders $ThreadFeedFooter when isLast', (tester) async {
        final visibleItems = [comment, comment];
        when(() => feed.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();

        await tester.pumpApp(
          buildSubject(
            (context) => builder.itemBuilder(context, 1),
          ),
        );

        expect(find.byType(ThreadFeedFooter), findsOneWidget);
      });
    });

    group('separatorBuilder', () {
      testWidgets('renders $ThreadFeedTopLevelDivider '
          'when nextComment.isTopLevel', (tester) async {
        final firstComment = OtherUserThreadCommentModel(
          comment: OtherUserThreadCommentPlaceholder(
            indent: 1,
          ),
        );
        final secondComment = OtherUserThreadCommentModel(
          comment: OtherUserThreadCommentPlaceholder(
            indent: 0,
          ),
        );
        final visibleItems = [firstComment, secondComment];
        when(() => feed.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();
        await tester.pumpApp(
          buildSubject(
            (context) => builder.separatorBuilder(context, 0),
          ),
        );
        expect(
          find.byType(ThreadFeedTopLevelDivider),
          findsOneWidget,
        );
      });

      testWidgets('returns $SizedBox.shrink when !nextComment.isTopLevel '
          'and !item.isExpanded', (tester) async {
        final firstComment = OtherUserThreadCommentModel(
          isExpanded: false,
          comment: OtherUserThreadCommentPlaceholder(
            indent: 1,
          ),
        );
        final secondComment = OtherUserThreadCommentModel(
          comment: OtherUserThreadCommentPlaceholder(
            indent: 1,
          ),
        );
        final visibleItems = [firstComment, secondComment];
        when(() => feed.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();
        await tester.pumpApp(
          buildSubject(
            (context) => builder.separatorBuilder(context, 0),
          ),
        );
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is SizedBox && widget.height == 0 && widget.width == 0,
          ),
          findsOneWidget,
        );
      });

      testWidgets('returns $SizedBox with correct height '
          'when !nextComment.isTopLevel '
          'and item.isExpanded', (tester) async {
        final firstComment = OtherUserThreadCommentModel(
          comment: OtherUserThreadCommentPlaceholder(
            indent: 1,
          ),
        );
        final secondComment = OtherUserThreadCommentModel(
          comment: OtherUserThreadCommentPlaceholder(
            indent: 1,
          ),
        );
        final visibleItems = [firstComment, secondComment];
        when(() => feed.visibleItems).thenReturn(visibleItems);
        final builder = createSubject();
        await tester.pumpApp(
          buildSubject(
            (context) => builder.separatorBuilder(context, 0),
          ),
        );
        expect(
          find.byWidgetPredicate(
            (widget) => widget is SizedBox && widget.height == AppSpacing.sm,
          ),
          findsOneWidget,
        );
      });
    });

    group('loadingBuilder', () {
      testWidgets('renders $PaginationSpinner', (tester) async {
        final builder = createSubject();
        await tester.pumpApp(buildSubject(builder.loadingBuilder));
        expect(find.byType(PaginationSpinner), findsOneWidget);
      });
    });
  });
}
