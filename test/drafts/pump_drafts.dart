// ignore_for_file: prefer_const_constructors

import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../app_shell/pump_app_shell.dart';

class _MockDraftRepository extends Mock implements DraftRepository {
  @override
  Stream<List<Draft>> get drafts => Stream.empty();
}

extension PumpDraftsExtension on WidgetTester {
  Future<void> pumpDrafts(Widget widgetUnderTest) async {
    return pumpAppShell(
      RepositoryProvider<DraftRepository>(
        create: (_) => _MockDraftRepository(),
        child: widgetUnderTest,
      ),
    );
  }
}
