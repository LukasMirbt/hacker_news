// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../app/pump_app.dart';

class _MockFeedRepository extends Mock implements FeedRepository {
  @override
  Stream<Set<String>> get visitedPosts => Stream.empty();

  @override
  Set<String> readVisitedPosts() => {};
}

class _MockAppShellModel extends Mock implements AppShellModel {}

extension PumpAppShellExtension on WidgetTester {
  Future<void> pumpAppShell(Widget widgetUnderTest) async {
    return pumpApp(
      RepositoryProvider<FeedRepository>(
        create: (_) => _MockFeedRepository(),
        child: Provider<AppShellModel>(
          create: (_) => _MockAppShellModel(),
          child: widgetUnderTest,
        ),
      ),
    );
  }
}
