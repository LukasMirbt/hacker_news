import 'package:flutter/foundation.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:link_launcher/link_launcher.dart';

extension LinkLaunchModeExtension on LinkLaunchMode {
  String title(AppLocalizations l10n) {
    return switch (this) {
      LinkLaunchMode.inAppBrowserView =>
        l10n.contentSettings_inAppBrowserLaunchModeTitle,
      LinkLaunchMode.externalApplication =>
        l10n.contentSettings_defaultBrowserLaunchModeTitle,
    };
  }

  String subtitle(AppLocalizations l10n, TargetPlatform platform) {
    return switch (this) {
      LinkLaunchMode.inAppBrowserView when platform == TargetPlatform.iOS =>
        l10n.contentSettings_inAppBrowserLaunchModeSubtitleIOS,
      LinkLaunchMode.inAppBrowserView =>
        l10n.contentSettings_inAppBrowserLaunchModeSubtitleAndroid,
      LinkLaunchMode.externalApplication =>
        l10n.contentSettings_defaultBrowserLaunchModeSubtitle,
    };
  }
}
