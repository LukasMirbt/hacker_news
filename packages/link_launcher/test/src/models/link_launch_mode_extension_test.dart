import 'package:flutter_test/flutter_test.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  group('LinkLaunchModeExtension', () {
    group('toLaunchMode', () {
      test('returns correct value '
          'for ${LinkLaunchMode.inAppBrowserView}', () {
        const mode = LinkLaunchMode.inAppBrowserView;
        expect(
          mode.toLaunchMode(),
          LaunchMode.inAppBrowserView,
        );
      });

      test('returns correct value '
          'for ${LinkLaunchMode.externalApplication}', () {
        const mode = LinkLaunchMode.externalApplication;
        expect(
          mode.toLaunchMode(),
          LaunchMode.externalApplication,
        );
      });
    });
  });
}
