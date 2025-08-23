// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/reply_options/reply_options.dart';
import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

class _MockOtherUserReplyParent extends Mock implements OtherUserReplyParent {}

void main() {
  final url = Uri.parse('https://example.com');
  const id = 'id';

  group(ReplyParentModel, () {
    late ReplyParent parent;
    late WebLinks webLinks;

    setUp(() {
      parent = _MockOtherUserReplyParent();
      webLinks = _MockWebLinks();
      when(() => parent.id).thenReturn(id);
    });

    ReplyParentModel createSubject() {
      return ReplyParentModel(
        parent,
        webLinks: webLinks,
      );
    }

    group('webRedirect', () {
      final getCommentUrl = () => webLinks.commentUrl(id);

      test('returns $WebRedirect with correct url', () {
        when(getCommentUrl).thenReturn(url);
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
        verify(getCommentUrl).called(1);
      });
    });

    group('shareText', () {
      final getCommentUrl = () => webLinks.commentUrl(id);

      test('returns correct value', () {
        when(getCommentUrl).thenReturn(url);
        final model = createSubject();
        expect(model.shareText, url.toString());
        verify(getCommentUrl).called(1);
      });
    });
  });
}
