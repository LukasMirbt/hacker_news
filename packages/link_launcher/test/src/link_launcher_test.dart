// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

class _MockSettingsStorage extends Mock implements SettingsStorage {}

class _MockUrlLauncherPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {}

void main() {
  group(LinkLauncher, () {
    late SettingsStorage storage;
    late WebLinks webLinks;
    late UrlLauncherPlatform platform;

    setUp(() {
      storage = _MockSettingsStorage();
      webLinks = _MockWebLinks();
      platform = _MockUrlLauncherPlatform();
      UrlLauncherPlatform.instance = platform;
      registerFallbackValue(LaunchOptions());
    });

    LinkLauncher createSubject() {
      return LinkLauncher(
        settingsStorage: storage,
        webLinks: webLinks,
      );
    }

    const urlString = 'https://www.example.com';
    final url = Uri.parse(urlString);
    const mode = LinkLaunchMode.inAppBrowserView;

    final matchesOptions = isA<LaunchOptions>().having(
      (options) => options.mode,
      'mode',
      PreferredLaunchMode.inAppBrowserView,
    );

    final resolve = () => webLinks.resolve(urlString);

    final readLinkLaunchMode = () => storage.readLinkLaunchMode();

    final launchUrl = () => platform.launchUrl(
      urlString,
      any(that: matchesOptions),
    );

    group('launchMode', () {
      test('returns correct value', () {
        when(storage.readLinkLaunchMode).thenReturn(mode);
        final launcher = createSubject();
        expect(launcher.launchMode, mode);
        verify(storage.readLinkLaunchMode).called(1);
      });
    });

    group('setLaunchMode', () {
      const mode = LinkLaunchMode.externalApplication;
      final writeLinkLaunchMode = () => storage.writeLinkLaunchMode(mode);

      test('calls storage.writeLinkLaunchMode', () async {
        when(writeLinkLaunchMode).thenAnswer((_) async {});
        final launcher = createSubject();
        await launcher.setLaunchMode(mode);
        verify(writeLinkLaunchMode).called(1);
      });
    });

    group('launch', () {
      test('calls launchUrl with correct url and mode', () async {
        when(resolve).thenReturn(url);
        when(readLinkLaunchMode).thenReturn(mode);
        when(launchUrl).thenAnswer((_) async => true);
        final service = createSubject();
        await service.launch(urlString);
        verify(resolve).called(1);
        verify(launchUrl).called(1);
      });

      test('throws $LinkException when launchUrl throws', () {
        final exception = Exception('oops');
        when(resolve).thenReturn(url);
        when(readLinkLaunchMode).thenReturn(mode);
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
    });
  });
}
