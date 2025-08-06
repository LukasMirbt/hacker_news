// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_api/reply_api.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockReplyParser extends Mock implements ReplyParser {}

class _MockPostParser extends Mock implements PostParser {}

class _MockDio extends Mock implements Dio {}

void main() {
  group(ReplyApi, () {
    late AppClient client;
    late ReplyParser replyParser;
    late PostParser postParser;
    late Dio http;

    setUp(() {
      client = _MockAppClient();
      replyParser = _MockReplyParser();
      postParser = _MockPostParser();
      http = _MockDio();
      when(() => client.http).thenReturn(http);
    });

    ReplyApi createSubject() {
      return ReplyApi(
        appClient: client,
        replyParser: replyParser,
        postParser: postParser,
      );
    }

    group('fetchReplyPage', () {
      const url = 'url';
      const html = 'html';
      final data = ReplyPageDataPlaceholder();

      final response = Response(
        requestOptions: RequestOptions(),
        data: html,
      );

      final request = () => http.get<String>(url);
      final parse = () => replyParser.parse(html);

      test('parses and returns $ReplyPageData', () async {
        when(request).thenAnswer((_) async => response);
        when(parse).thenReturn(data);
        final api = createSubject();
        await expectLater(
          api.fetchReplyPage(url: url),
          completion(data),
        );
        verify(request).called(1);
        verify(parse).called(1);
      });
    });

    group('reply', () {
      const form = ReplyFormPlaceholder();

      final request = () => http.post<String>(
        'comment',
        options: any(
          named: 'options',
          that: isA<RedirectValidationOptions>().having(
            (options) => options.contentType,
            'contentType',
            Headers.formUrlEncodedContentType,
          ),
        ),
        data: form.toData(),
      );

      test('makes correct request', () {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
          ),
        );
        final api = createSubject();
        expect(api.reply(form), completes);
        verify(request).called(1);
      });
    });

    group('fetchCommentThread', () {
      const id = 'id';
      final post = PostDataPlaceholder();
      const html = 'html';

      final response = Response(
        requestOptions: RequestOptions(),
        data: html,
      );

      final request = () => http.get<String>(
        'item',
        queryParameters: {'id': id},
      );

      final parse = () => postParser.parse(html);

      test('parses and returns comments', () async {
        when(request).thenAnswer((_) async => response);
        when(parse).thenReturn(post);
        final api = createSubject();
        await expectLater(
          api.fetchCommentThread(id: id),
          completion(post.comments),
        );
        verify(request).called(1);
        verify(parse).called(1);
      });
    });
  });
}
