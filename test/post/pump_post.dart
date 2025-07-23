// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../app_shell/pump_app_shell.dart';

class _MockPostRepository extends Mock implements PostRepository {
  @override
  Post get state => PostPlaceholder(
    comments: [
      CommentPlaceholder(id: 'commentId'),
    ],
  );

  @override
  Stream<Post> get stream => Stream.empty();
}

extension PumpPostExtension on WidgetTester {
  Future<void> pumpPost(
    Widget widgetUnderTest, {
    GoRouter? router,
  }) async {
    return pumpAppShell(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PostRepository>(
            create: (_) => _MockPostRepository(),
          ),
        ],
        child: widgetUnderTest,
      ),
    );
  }

  Future<void> pumpPostWithContext(
    void Function(BuildContext) show,
  ) async {
    final widget = Container();
    await pumpPost(widget);
    final context = element(find.byWidget(widget));
    show(context);
    await pump();
  }
}
