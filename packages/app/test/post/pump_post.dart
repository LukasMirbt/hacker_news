// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:post_search_repository/post_search_repository.dart';

import '../app_shell/pump_app_shell.dart';

class _MockPostRepository extends Mock implements PostRepository {
  @override
  PostRepositoryState get state => PostRepositoryState.initial();

  @override
  Stream<PostRepositoryState> get stream => Stream.empty();

  @override
  Future<void> fetchPostStream({required String id}) async {}

  @override
  Stream<Set<String>> get visitedPosts => Stream.empty();

  @override
  Set<String> readVisitedPosts() => {};
}

class _MockPostSearchRepository extends Mock implements PostSearchRepository {
  @override
  Stream<SelectedComment> get selectedComment => Stream.empty();

  @override
  String get query => '';
}

extension PumpPostExtension on WidgetTester {
  Future<void> pumpPost(Widget widgetUnderTest) async {
    return pumpAppShell(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PostRepository>(
            create: (_) => _MockPostRepository(),
          ),
          RepositoryProvider<PostSearchRepository>(
            create: (_) => _MockPostSearchRepository(),
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
