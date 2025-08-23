// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:app/home/home.dart';
import 'package:app/l10n/l10n.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group('FeedTypeExtension', () {
    group('title', () {
      test('returns correct value for ${FeedType.top}', () {
        const type = FeedType.top;
        expect(type.title(l10n), l10n.home_topTab);
      });

      test('returns correct value for ${FeedType.newest}', () {
        const type = FeedType.newest;
        expect(type.title(l10n), l10n.home_newTab);
      });

      test('returns correct value for ${FeedType.past}', () {
        const type = FeedType.past;
        expect(type.title(l10n), l10n.home_pastTab);
      });

      test('returns correct value for ${FeedType.ask}', () {
        const type = FeedType.ask;
        expect(type.title(l10n), l10n.home_askTab);
      });

      test('returns correct value for ${FeedType.show}', () {
        const type = FeedType.show;
        expect(type.title(l10n), l10n.home_showTab);
      });

      test('returns correct value for ${FeedType.jobs}', () {
        const type = FeedType.jobs;
        expect(type.title(l10n), l10n.home_jobsTab);
      });

      test('returns correct value for ${FeedType.whoIsHiring}', () {
        const type = FeedType.whoIsHiring;
        expect(type.title(l10n), l10n.home_whoIsHiringTab);
      });
    });
  });
}
