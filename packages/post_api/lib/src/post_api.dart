import 'dart:async';
import 'dart:io';

import 'package:app_client/app_client.dart';
import 'package:equatable/equatable.dart';
import 'package:post_api/post_api.dart';

class PostStreamFailure with EquatableMixin implements Exception {
  const PostStreamFailure(this.statusCode);

  final int statusCode;

  @override
  List<Object> get props => [statusCode];
}

class PostApi {
  PostApi({
    required AppClient appClient,
    CancelTokenService? cancelTokenService,
    PostStreamParser? postStreamParser,
    ReplyFormParser? replyFormParser,
    BackgroundPostParser? postParser,
  }) : _client = appClient,
       _cancelTokenService = cancelTokenService ?? CancelTokenService(),
       _postStreamParser = postStreamParser ?? PostStreamParser(),
       _replyFormParser = replyFormParser ?? ReplyFormParser(),
       _postParser = postParser ?? BackgroundPostParser();

  final AppClient _client;
  final CancelTokenService _cancelTokenService;
  final PostStreamParser _postStreamParser;
  final ReplyFormParser _replyFormParser;
  final BackgroundPostParser _postParser;

  Stream<PostData> fetchPostStream({required String id}) async* {
    final cancelToken = _cancelTokenService.generate();

    final response = await _client.http.get<ResponseBody>(
      'item',
      queryParameters: {'id': id},
      cancelToken: cancelToken,
      options: Options(
        responseType: ResponseType.stream,
      ),
    );

    final responseBody = response.data!;
    final statusCode = responseBody.statusCode;
    if (statusCode != 200) throw PostStreamFailure(statusCode);

    final postStream = _postStreamParser.parse(responseBody.stream);

    await for (final post in postStream) {
      if (cancelToken.isCancelled) break;
      yield post;
    }
  }

  Future<PostData> fetchPost({required String id}) async {
    final cancelToken = _cancelTokenService.generate();

    final response = await _client.http.get<String>(
      'item',
      queryParameters: {'id': id},
      cancelToken: cancelToken,
    );

    final html = response.data!;
    final post = _postParser.parse(html);
    return post;
  }

  Future<PostData> comment({
    required String postId,
    required String hmac,
    required String text,
  }) async {
    final gotoUri = Uri(
      path: 'item',
      queryParameters: {'id': postId},
    );

    final goto = gotoUri.toString();

    final response = await _client.http.post<String>(
      'comment',
      options: RedirectValidationOptions(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: {
        'parent': postId,
        'goto': goto,
        'hmac': hmac,
        'text': text,
      },
    );

    final redirect = response.headers.value(HttpHeaders.locationHeader)!;

    final redirectResponse = await _client.http.get<String>(redirect);
    final html = redirectResponse.data!;
    final post = _postParser.parse(html);

    return post;
  }

  Future<ReplyFormData> fetchReplyForm({
    required String itemId,
    required String commentId,
  }) async {
    final gotoUri = Uri(
      path: 'item',
      queryParameters: {'id': itemId},
      fragment: commentId,
    );

    final goto = gotoUri.toString();

    final response = await _client.http.get<String>(
      'reply',
      queryParameters: {
        'id': commentId,
        'goto': goto,
      },
    );

    final html = response.data!;
    final data = _replyFormParser.parse(html);
    return data;
  }

  Future<PostData> reply({
    required String postId,
    required String commentId,
    required String hmac,
    required String text,
  }) async {
    final gotoUri = Uri(
      path: 'item',
      queryParameters: {
        'id': postId,
      },
      fragment: commentId,
    );

    final goto = gotoUri.toString();

    final response = await _client.http.post<String>(
      'comment',
      options: RedirectValidationOptions(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: {
        'parent': commentId,
        'goto': goto,
        'hmac': hmac,
        'text': text,
      },
    );

    final redirect = response.headers.value(HttpHeaders.locationHeader)!;

    final redirectResponse = await _client.http.get<String>(redirect);
    final html = redirectResponse.data!;
    final post = _postParser.parse(html);

    return post;
  }
}
