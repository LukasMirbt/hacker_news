import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_links/web_links.dart';

class LinkException with EquatableMixin implements Exception {
  const LinkException(this.error);

  final Object? error;

  @override
  List<Object?> get props => [error];
}

class LinkFailure with EquatableMixin implements Exception {
  const LinkFailure(this.url);

  final Object? url;

  @override
  List<Object?> get props => [url];
}

class LinkLauncher {
  const LinkLauncher({
    WebLinks? webLinks,
    /*  LaunchModeService? launchModeService, */
  }) : _webLinks = webLinks ?? const WebLinks();

  final WebLinks _webLinks;
  /*   final LaunchModeStorage _launchModeStorage; */

  Future<void> launch(String urlString) async {
    bool didLaunch;

    try {
      final url = _webLinks.resolve(urlString);
      /*       final mode = _launchModeStorage.read(); */

      didLaunch = await launchUrl(
        url,
        mode: LaunchMode.inAppBrowserView,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        LinkException(error),
        stackTrace,
      );
    }

    if (!didLaunch) throw LinkFailure(urlString);
  }

  /*   LaunchMode get launchMode => _launchModeStorage.read();

  void toggleLaunchMode() {
    final launchMode = await _
  } */
}
