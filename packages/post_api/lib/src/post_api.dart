import 'dart:async';

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
    BackgroundPostParser? postParser,
  }) : _client = appClient,
       _cancelTokenService = cancelTokenService ?? CancelTokenService(),
       _postStreamParser = postStreamParser ?? PostStreamParser(),
       _postParser = postParser ?? BackgroundPostParser();

  final AppClient _client;
  final CancelTokenService _cancelTokenService;
  final PostStreamParser _postStreamParser;
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

  Future<void> comment(CommentForm form) async {
    await _client.http.post<String>(
      'comment',
      options: RedirectValidationOptions(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: form.toData(),
    );
  }
}
