import 'package:flutter_test/flutter_test.dart';
import 'package:settings_storage/settings_storage.dart';

void main() {
  group(LinkLaunchMode, () {
    group('name', () {
      test('returns correct value '
          'for ${LinkLaunchMode.inAppBrowserView}', () {
        const mode = LinkLaunchMode.inAppBrowserView;
        expect(mode.name, 'inAppBrowserView');
      });

      test('returns correct value '
          'for ${LinkLaunchMode.externalApplication}', () {
        const mode = LinkLaunchMode.externalApplication;
        expect(mode.name, 'externalApplication');
      });
    });

    group('initial', () {
      test('returns correct value', () {
        expect(
          LinkLaunchMode.initial,
          LinkLaunchMode.inAppBrowserView,
        );
      });
    });
  });
}
