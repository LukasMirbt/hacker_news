// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:typed_data';

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_api/post_api.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockDio extends Mock implements Dio {}

class _MockPostStreamParser extends Mock implements PostStreamParser {}

class _MockBackgroundPostParser extends Mock implements BackgroundPostParser {}

class _MockResponse<T> extends Mock implements Response<T> {}

class _MockResponseBody extends Mock implements ResponseBody {}

class _MockCancelToken extends Mock implements CancelToken {}

void main() {
  group(PostApi, () {
    late AppClient client;
    late Dio http;
    late PostStreamParser postStreamParser;
    late BackgroundPostParser postParser;
    late CancelToken cancelToken;

    setUp(() {
      client = _MockAppClient();
      http = _MockDio();
      postStreamParser = _MockPostStreamParser();
      postParser = _MockBackgroundPostParser();
      cancelToken = _MockCancelToken();
      registerFallbackValue(RedirectValidationOptions());
      when(() => client.http).thenReturn(http);
      when(() => cancelToken.isCancelled).thenReturn(false);
    });

    PostApi createSubject() {
      return PostApi(
        appClient: client,
        postStreamParser: postStreamParser,
        postParser: postParser,
      );
    }

    group('constructor', () {
      test('returns normally', () {
        expect(
          () => PostApi(appClient: client),
          returnsNormally,
        );
      });
    });

    group('fetchPostStream', () {
      const id = 'id';
      final bodyStream = Stream<Uint8List>.empty();
      final posts = [PostDataPlaceholder()];
      final parsedStream = Stream<PostData>.fromIterable(posts);

      final parse = () => postStreamParser.parse(bodyStream);

      late Response<ResponseBody> response;
      late ResponseBody responseBody;
      late Future<Response<ResponseBody>> Function() request;

      setUp(() {
        response = _MockResponse();
        responseBody = _MockResponseBody();
        request = () => http.get<ResponseBody>(
          'item',
          queryParameters: {'id': id},
          cancelToken: cancelToken,
          options: any(
            named: 'options',
            that: isA<Options>().having(
              (options) => options.responseType,
              'responseType',
              ResponseType.stream,
            ),
          ),
        );
        when(request).thenAnswer((_) async => response);
        when(() => responseBody.statusCode).thenReturn(200);
        when(() => response.data).thenReturn(responseBody);
        when(() => responseBody.stream).thenAnswer((_) => bodyStream);
        when(parse).thenAnswer((_) => parsedStream);
      });

      test('throws $PostStreamFailure when statusCode is not 200', () async {
        const statusCode = 400;
        when(() => responseBody.statusCode).thenReturn(statusCode);

        final api = createSubject();

        await expectLater(
          api.fetchPostStream(
            id: id,
            cancelToken: cancelToken,
          ),
          emitsError(
            PostStreamFailure(statusCode),
          ),
        );

        verify(request).called(1);
      });

      test('parses and emits each post in postStream', () async {
        final api = createSubject();

        await expectLater(
          api.fetchPostStream(
            id: id,
            cancelToken: cancelToken,
          ),
          emitsInOrder(posts),
        );

        verify(request).called(1);
        verify(parse).called(1);
      });

      test('breaks when canceled', () async {
        when(() => cancelToken.isCancelled).thenReturn(true);

        final api = createSubject();

        await expectLater(
          api.fetchPostStream(id: id, cancelToken: cancelToken),
          neverEmits(anything),
        );

        verify(request).called(1);
        verify(parse).called(1);
      });
    });

    group('fetchPost', () {
      late Response<String> response;

      setUp(() {
        response = _MockResponse<String>();
      });

      const id = 'id';
      const html = 'html';
      final post = PostDataPlaceholder();

      final parse = () => postParser.parse(html);

      final request = () => http.get<String>(
        'item',
        queryParameters: {'id': id},
        cancelToken: cancelToken,
      );

      test('parses and returns post', () async {
        when(request).thenAnswer((_) async => response);
        when(() => response.data).thenReturn(html);
        when(parse).thenAnswer((_) async => post);
        final api = createSubject();
        await expectLater(
          api.fetchPost(id: id, cancelToken: cancelToken),
          completion(post),
        );
        verify(request).called(1);
        verify(parse).called(1);
      });
    });

    group('comment', () {
      final form = CommentFormPlaceholder();

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

      test('makes correct request', () async {
        when(request).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
          ),
        );
        final api = createSubject();
        await expectLater(api.comment(form), completes);
        verify(request).called(1);
      });
    });
  });
}
