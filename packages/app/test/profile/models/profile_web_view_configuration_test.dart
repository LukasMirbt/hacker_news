import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/profile/profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

void main() {
  const id = 'id';
  final profileUrl = Uri.parse('https://www.example.com/profile?id=$id');

  group(ProfileWebViewConfiguration, () {
    late WebLinks links;

    setUp(() {
      links = _MockWebLinks();
      when(() => links.profileUrl(id)).thenReturn(profileUrl);
    });

    ProfileWebViewConfiguration createSubject() {
      return ProfileWebViewConfiguration(
        id: id,
        links: links,
      );
    }

    test('is an $AppWebViewConfiguration', () {
      final configuration = createSubject();
      expect(configuration, isA<AppWebViewConfiguration>());
    });

    group('initialUrl', () {
      test('has correct value', () {
        final configuration = createSubject();
        expect(configuration.initialUrl, profileUrl);
      });
    });
  });
}
