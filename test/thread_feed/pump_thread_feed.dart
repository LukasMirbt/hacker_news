// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

import '../app_shell/pump_app_shell.dart';

class _MockThreadRepository extends Mock implements ThreadRepository {}

extension PumpThreadFeedExtension on WidgetTester {
  Future<void> pumpThreadFeed(
    Widget widgetUnderTest, {
    GoRouter? router,
  }) async {
    return pumpAppShell(
      RepositoryProvider<ThreadRepository>(
        create: (_) => _MockThreadRepository(),
        child: widgetUnderTest,
      ),
    );
  }
}
