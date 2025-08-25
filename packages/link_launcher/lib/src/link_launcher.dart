import 'package:authentication_api/authentication_api.dart';
import 'package:equatable/equatable.dart';
import 'package:link_launcher/src/models/link_launch_mode_extension.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkException with EquatableMixin implements Exception {
  const LinkException(this.error);

  final Object? error;

  @override
  List<Object?> get props => [error];
}

class LinkLauncher {
  const LinkLauncher({
    required AuthenticationApi authenticationApi,
    required SettingsStorage settingsStorage,
  }) : _api = authenticationApi,
       _storage = settingsStorage;

  final AuthenticationApi _api;
  final SettingsStorage _storage;

  LinkLaunchMode get launchMode => _storage.readLinkLaunchMode();

  Future<void> setLaunchMode(LinkLaunchMode mode) async {
    await _storage.writeLinkLaunchMode(mode);
  }

  Future<void> launch(String url) async {
    try {
      final resolvedUrl = _api.resolve(url);
      final mode = _storage.readLinkLaunchMode();

      await launchUrl(
        resolvedUrl,
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
