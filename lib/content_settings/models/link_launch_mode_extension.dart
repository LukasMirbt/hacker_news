import 'package:hacker_client/content_settings/content_settings.dart';
import 'package:hacker_client/l10n/l10n.dart';

extension LinkLaunchModeExtension on LinkLaunchMode {
  String label(AppLocalizations l10n) {
    return switch (this) {
      LinkLaunchMode.inApp => l10n.contentSettings_inAppLaunchMode,
      LinkLaunchMode.external => l10n.contentSettings_externalLaunchMode,
    };
  }
}
