// ignore_for_file: prefer_const_constructors

import 'package:app/post_header/post_header.dart';
import 'package:app_ui/app_ui.dart' hide PostHeaderBody;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

void main() {
  final initialState = PostHeaderState.initial(
    id: 'id',
    visitedPosts: {},
  );

  group(PostHeaderView, () {
    late PostHeaderBloc bloc;

    setUp(() {
      bloc = _MockPostHeaderBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PostHeaderView(),
      );
    }

    testWidgets('renders skeletonized $PostHeaderBody '
        'when isPlaceholder ', (tester) async {
      await tester.pumpApp(buildSubject());
      final skeletonizerScope = tester.widget<SkeletonizerScope>(
        find.ancestor(
          of: find.byType(PostHeaderBody),
          matching: find.byType(SkeletonizerScope),
        ),
      );
      expect(skeletonizerScope.enabled, true);
    });

    testWidgets('renders non-skeletonized $PostHeaderBody '
        'when !isPlaceholder', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          header: PostHeaderModel(
            PostHeaderPlaceholder(),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      final skeletonizerScope = tester.widget<SkeletonizerScope>(
        find.ancestor(
          of: find.byType(PostHeaderBody),
          matching: find.byType(SkeletonizerScope),
        ),
      );
      expect(skeletonizerScope.enabled, false);
    });
  });
}
