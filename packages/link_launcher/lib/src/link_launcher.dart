import 'package:equatable/equatable.dart';
import 'package:link_launcher/src/models/link_launch_mode_extension.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_links/web_links.dart';

class LinkException with EquatableMixin implements Exception {
  const LinkException(this.error);

  final Object? error;

  @override
  List<Object?> get props => [error];
}

class LinkLauncher {
  const LinkLauncher({
    required SettingsStorage settingsStorage,
    WebLinks? webLinks,
  }) : _storage = settingsStorage,
       _webLinks = webLinks ?? const WebLinks();

  final SettingsStorage _storage;
  final WebLinks _webLinks;

  LinkLaunchMode get launchMode => _storage.readLinkLaunchMode();

  Future<void> setLaunchMode(LinkLaunchMode mode) async {
    await _storage.writeLinkLaunchMode(mode);
  }

  Future<void> launch(String urlString) async {
    try {
      final url = _webLinks.resolve(urlString);
      final mode = _storage.readLinkLaunchMode();

      await launchUrl(
        url,
        mode: mode.toLaunchMode(),
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        LinkException(error),
        stackTrace,
      );
    }
  }
}
