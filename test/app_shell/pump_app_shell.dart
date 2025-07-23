// ignore_for_file: prefer_const_constructors

import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../app/pump_app.dart';

class _MockFeedRepository extends Mock implements FeedRepository {}

class _MockStatefulNavigationShell extends Mock
    with Diagnosticable
    implements StatefulNavigationShell {
  @override
  int get currentIndex => 0;
}

extension PumpAppShellExtension on WidgetTester {
  Future<void> pumpAppShell(Widget widgetUnderTest) async {
    return pumpApp(
      RepositoryProvider<FeedRepository>(
        create: (_) => _MockFeedRepository(),
        child: Provider<StatefulNavigationShell>(
          create: (_) => _MockStatefulNavigationShell(),
          child: widgetUnderTest,
        ),
      ),
    );
  }
}
