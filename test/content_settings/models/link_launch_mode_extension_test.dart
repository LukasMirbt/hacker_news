// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/content_settings/content_settings.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:link_launcher/link_launcher.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group('LinkLaunchModeExtension', () {
    group('title', () {
      test('returns correct value '
          'for ${LinkLaunchMode.inAppBrowserView}', () {
        const mode = LinkLaunchMode.inAppBrowserView;
        expect(
          mode.title(l10n),
          l10n.contentSettings_inAppBrowserLaunchModeTitle,
        );
      });

      test('returns correct value '
          'for ${LinkLaunchMode.externalApplication}', () {
        const mode = LinkLaunchMode.externalApplication;
        expect(
          mode.title(l10n),
          l10n.contentSettings_defaultBrowserLaunchModeTitle,
        );
      });
    });

    group('subtitle', () {
      test('returns correct value '
          'for ${LinkLaunchMode.inAppBrowserView} '
          'when platform is ${TargetPlatform.iOS}', () {
        const mode = LinkLaunchMode.inAppBrowserView;
        const platform = TargetPlatform.iOS;
        expect(
          mode.subtitle(l10n, platform),
          l10n.contentSettings_inAppBrowserLaunchModeSubtitleIOS,
        );
      });

      test('returns correct value '
          'for ${LinkLaunchMode.inAppBrowserView} '
          'when platform is not ${TargetPlatform.iOS}', () {
        const mode = LinkLaunchMode.inAppBrowserView;
        const platform = TargetPlatform.android;
        expect(
          mode.subtitle(l10n, platform),
          l10n.contentSettings_inAppBrowserLaunchModeSubtitleAndroid,
        );
      });

      test('returns correct value '
          'for ${LinkLaunchMode.externalApplication}', () {
        const mode = LinkLaunchMode.externalApplication;
        const platform = TargetPlatform.android;
        expect(
          mode.subtitle(l10n, platform),
          l10n.contentSettings_defaultBrowserLaunchModeSubtitle,
        );
      });
    });
  });
}
