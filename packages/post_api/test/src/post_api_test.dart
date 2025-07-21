// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:io';
import 'dart:typed_data';

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_api/post_api.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockDio extends Mock implements Dio {}

class _MockCancelTokenService extends Mock implements CancelTokenService {}

class _MockPostStreamParser extends Mock implements PostStreamParser {}

class _MockBackgroundPostParser extends Mock implements BackgroundPostParser {}

class _MockResponse<T> extends Mock implements Response<T> {}

class _MockResponseBody extends Mock implements ResponseBody {}

void main() {
  group(PostApi, () {
    late AppClient client;
    late Dio http;
    late CancelTokenService cancelTokenService;
    late PostStreamParser postStreamParser;
    late BackgroundPostParser postParser;

    setUp(() {
      client = _MockAppClient();
      http = _MockDio();
      cancelTokenService = _MockCancelTokenService();
      postStreamParser = _MockPostStreamParser();
      postParser = _MockBackgroundPostParser();
      when(() => client.http).thenReturn(http);
      registerFallbackValue(RedirectValidationOptions());
    });

    PostApi createSubject() {
      return PostApi(
        appClient: client,
        cancelTokenService: cancelTokenService,
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

      final generate = () => cancelTokenService.generate();
      final parse = () => postStreamParser.parse(bodyStream);

      late CancelToken cancelToken;
      late Response<ResponseBody> response;
      late ResponseBody responseBody;
      late Future<Response<ResponseBody>> Function() request;

      setUp(() {
        cancelToken = CancelToken();
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
        when(generate).thenReturn(cancelToken);
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
          api.fetchPostStream(id: id),
          emitsError(
            PostStreamFailure(statusCode),
          ),
        );

        verify(generate).called(1);
        verify(request).called(1);
      });

      test('parses and emits each post in postStream', () async {
        final api = createSubject();

        await expectLater(
          api.fetchPostStream(id: id),
          emitsInOrder(posts),
        );

        verify(generate).called(1);
        verify(request).called(1);
        verify(parse).called(1);
      });

      test('breaks when canceled', () async {
        cancelToken.cancel();

        final api = createSubject();

        await expectLater(
          api.fetchPostStream(id: id),
          neverEmits(anything),
        );

        verify(generate).called(1);
        verify(request).called(1);
        verify(parse).called(1);
      });
    });

    group('fetchPost', () {
      late Response<String> response;
      late CancelToken cancelToken;

      setUp(() {
        cancelToken = CancelToken();
        response = _MockResponse<String>();
      });

      const id = 'id';
      const html = 'html';
      final post = PostDataPlaceholder();

      final generate = () => cancelTokenService.generate();
      final parse = () => postParser.parse(html);

      final request = () => http.get<String>(
        'item',
        queryParameters: {'id': id},
        cancelToken: cancelToken,
      );

      test('parses and returns post', () async {
        when(generate).thenReturn(cancelToken);
        when(request).thenAnswer((_) async => response);
        when(() => response.data).thenReturn(html);
        when(parse).thenAnswer((_) async => post);
        final api = createSubject();
        await expectLater(
          api.fetchPost(id: id),
          completion(post),
        );
        verify(generate).called(1);
        verify(request).called(1);
        verify(parse).called(1);
      });
    });

    group('comment', () {
      const postId = 'postId';
      const hmac = 'hmac';
      const text = 'text';

      final gotoUri = Uri(
        path: 'item',
        queryParameters: {'id': postId},
      );

      final goto = gotoUri.toString();

      final commentRequest = () => http.post<String>(
        'comment',
        options: any(
          named: 'options',
          that: isA<RedirectValidationOptions>().having(
            (options) => options.contentType,
            'contentType',
            Headers.formUrlEncodedContentType,
          ),
        ),
        data: {
          'parent': postId,
          'goto': goto,
          'hmac': hmac,
          'text': text,
        },
      );

      const redirect = 'redirect';

      final headers = Headers.fromMap({
        HttpHeaders.locationHeader: [redirect],
      });

      final redirectRequest = () => http.get<String>(redirect);

      const html = 'html';
      final post = PostDataPlaceholder();
      final parse = () => postParser.parse(html);

      test('makes comment request, follows redirect '
          'and returns parsed post', () async {
        when(commentRequest).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            headers: headers,
          ),
        );
        when(redirectRequest).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            data: html,
          ),
        );
        when(parse).thenAnswer((_) async => post);
        final api = createSubject();
        await expectLater(
          api.comment(
            postId: postId,
            hmac: hmac,
            text: text,
          ),
          completion(post),
        );
        verify(commentRequest).called(1);
        verify(redirectRequest).called(1);
        verify(parse).called(1);
      });
    });
  });
}
