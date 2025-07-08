// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

class _MockUrlLauncherPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {}

void main() {
  group(LinkLauncher, () {
    late WebLinks webLinks;
    late UrlLauncherPlatform platform;

    setUp(() {
      webLinks = _MockWebLinks();
      platform = _MockUrlLauncherPlatform();
      UrlLauncherPlatform.instance = platform;
      registerFallbackValue(LaunchOptions());
    });

    const urlString = 'https://www.example.com';
    final url = Uri.parse(urlString);

    LinkLauncher createSubject() {
      return LinkLauncher(webLinks: webLinks);
    }

    final matchesOptions = isA<LaunchOptions>().having(
      (options) => options.mode,
      'mode',
      PreferredLaunchMode.inAppBrowserView,
    );

    final resolve = () => webLinks.resolve(urlString);

    final launchUrl = () => platform.launchUrl(
      urlString,
      any(that: matchesOptions),
    );

    group('launch', () {
      test('calls resolve, launchUrl and returns '
          'when launchUrl returns true', () async {
        when(resolve).thenReturn(url);
        when(launchUrl).thenAnswer((_) async => true);
        final service = createSubject();
        await service.launch(urlString);
        verify(resolve).called(1);
        verify(launchUrl).called(1);
      });

      test('throws $LinkException when launchUrl throws', () {
        final exception = Exception('oops');
        when(resolve).thenReturn(url);
        when(launchUrl).thenThrow(exception);
        final service = createSubject();
        expect(
          service.launch(urlString),
          throwsA(
            LinkException(exception),
          ),
        );
        verify(resolve).called(1);
        verify(launchUrl).called(1);
      });

      test('throws $LinkFailure when launchUrl returns false', () {
        when(resolve).thenReturn(url);
        when(launchUrl).thenAnswer((_) async => false);
        final service = createSubject();
        expect(
          service.launch(urlString),
          throwsA(
            LinkFailure(urlString),
          ),
        );
        verify(resolve).called(1);
        verify(launchUrl).called(1);
      });
    });
  });
}
