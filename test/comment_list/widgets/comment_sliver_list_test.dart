import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

class _MockCommentListState extends Mock implements CommentListState {}

class _MockCommentListModel extends Mock implements CommentListModel {}

class _MockCommentListBuilder extends Mock implements CommentListBuilder {}

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  final visibleItems = List.filled(
    10,
    OtherUserCommentModel(
      comment: OtherUserCommentPlaceholder(),
    ),
  );

  final item = Container();
  final separator = Container();

  group(CommentSliverList, () {
    late CommentListBloc bloc;
    late CommentListState state;
    late CommentListModel commentList;
    late CommentListBuilder builder;
    late BuildContext context;

    setUp(() {
      bloc = _MockCommentListBloc();
      state = _MockCommentListState();
      commentList = _MockCommentListModel();
      builder = _MockCommentListBuilder();
      context = _MockBuildContext();
      when(() => bloc.state).thenReturn(state);
      when(() => state.commentList).thenReturn(commentList);
      when(() => commentList.visibleItems).thenReturn(visibleItems);
      registerFallbackValue(context);
      when(
        () => builder.itemBuilder(any(), any()),
      ).thenAnswer((_) => item);
      when(
        () => builder.separatorBuilder(any(), any()),
      ).thenAnswer((_) => separator);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CustomScrollView(
          slivers: [
            CommentSliverList(builder: builder),
          ],
        ),
      );
    }

    testWidgets('has correct itemBuilder', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byWidget(item, skipOffstage: false),
        findsNWidgets(visibleItems.length),
      );
    });

    testWidgets('has correct separatorBuilder', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byWidget(separator, skipOffstage: false),
        findsNWidgets(visibleItems.length - 1),
      );
    });
  });
}
