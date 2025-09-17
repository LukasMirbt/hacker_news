// ignore_for_file: prefer_const_constructors

import 'package:app/post_options/post_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';
import '../../post/pump_post.dart';

class _MockPostOptionsBloc extends MockBloc<void, PostOptionsState>
    implements PostOptionsBloc {}

void main() {
  final post = PostPlaceholder();

  group(PostOptionsSheet, () {
    late PostOptionsBloc bloc;

    setUp(() {
      bloc = _MockPostOptionsBloc();
      when(() => bloc.state).thenReturn(
        PostOptionsState.from(post),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PostOptionsSheet(),
      );
    }

    group('show', () {
      testWidgets('renders $PostOptionsSheet', (tester) async {
        await tester.pumpPostWithContext(PostOptionsSheet.show);
        expect(
          find.byType(PostOptionsSheet),
          findsOneWidget,
        );
      });
    });

    testWidgets('renders $AppBottomSheet', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBottomSheet), findsOneWidget);
    });

    testWidgets('renders $UserOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(UserOption), findsOneWidget);
    });

    testWidgets('renders $MoreFromSiteOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(MoreFromSiteOption), findsOneWidget);
    });

    testWidgets('renders $OpenOnWebOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(OpenOnWebOption), findsOneWidget);
    });
  });
}
