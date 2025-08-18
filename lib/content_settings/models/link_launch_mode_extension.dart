import 'package:hacker_client/l10n/l10n.dart';
import 'package:link_launcher/link_launcher.dart';

extension LinkLaunchModeExtension on LinkLaunchMode {
  String label(AppLocalizations l10n) {
    return switch (this) {
      LinkLaunchMode.inAppBrowserView => l10n.contentSettings_inAppLaunchMode,
      LinkLaunchMode.externalApplication =>
        l10n.contentSettings_externalLaunchMode,
    };
  }
}
