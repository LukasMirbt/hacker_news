// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:app/drafts/drafts.dart';
import 'package:app/home/home.dart';
import 'package:app/search/search.dart';
import 'package:app/settings/settings.dart';
import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppDestination, () {
    group('route', () {
      test('returns correct route for ${AppDestination.home}', () {
        const destination = AppDestination.home;
        expect(destination.route, HomeRoute());
      });

      test('returns correct route for ${AppDestination.search}', () {
        const destination = AppDestination.search;
        expect(destination.route, SearchRoute());
      });

      test('returns correct route for ${AppDestination.threads}', () {
        const destination = AppDestination.threads;
        expect(destination.route, ThreadFeedRoute());
      });

      test('returns correct route for ${AppDestination.drafts}', () {
        const destination = AppDestination.drafts;
        expect(destination.route, DraftRoute());
      });

      test('returns correct route for ${AppDestination.settings}', () {
        const destination = AppDestination.settings;
        expect(destination.route, SettingsRoute());
      });
    });
  });
}
