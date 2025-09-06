// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/post_options/post_options.dart';
import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

class _MockPost extends Mock implements Post {}

class _MockPostHeader extends Mock implements PostHeader {}

void main() {
  const id = 'id';

  group(PostModel, () {
    late Post post;
    late PostHeader header;
    late WebLinks webLinks;

    setUp(() {
      post = _MockPost();
      header = _MockPostHeader();
      webLinks = _MockWebLinks();
      when(() => post.header).thenReturn(header);
      when(() => header.id).thenReturn(id);
    });

    PostModel createSubject() {
      return PostModel(
        post,
        webLinks: webLinks,
      );
    }

    group('webRedirect', () {
      final url = Uri.parse('https://example.com');
      final getPostUrl = () => webLinks.postUrl(id);

      test('returns $WebRedirect with correct url', () {
        when(getPostUrl).thenReturn(url);
        final model = createSubject();
        final redirect = model.webRedirect;
        expect(
          redirect,
          isA<WebRedirect>().having(
            (redirect) => redirect.url,
            'url',
            url,
          ),
        );
        verify(getPostUrl).called(1);
      });
    });
  });
}
