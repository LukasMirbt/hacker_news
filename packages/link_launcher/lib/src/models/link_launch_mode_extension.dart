import 'package:settings_storage/settings_storage.dart';
import 'package:url_launcher/url_launcher.dart';

extension LinkLaunchModeExtension on LinkLaunchMode {
  LaunchMode toLaunchMode() {
    return switch (this) {
      LinkLaunchMode.inAppBrowserView => LaunchMode.inAppBrowserView,
      LinkLaunchMode.externalApplication => LaunchMode.externalApplication,
    };
  }
}
