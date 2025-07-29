import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:reply_repository/reply_repository.dart';

class ReplyRepository {
  ReplyRepository({
    required ReplyApi replyApi,
    required AuthenticationApi authenticationApi,
    required ReplyStorage replyStorage,
    UserReplyService? userReplyService,
  }) : _replyApi = replyApi,
       _authenticationApi = authenticationApi,
       _replyStorage = replyStorage,
       _userReplyService = userReplyService ?? const UserReplyService();

  final ReplyApi _replyApi;
  final AuthenticationApi _authenticationApi;
  final ReplyStorage _replyStorage;
  final UserReplyService _userReplyService;

  final _controller = StreamController<ReplyUpdate>.broadcast();
  Stream<ReplyUpdate> get stream => _controller.stream;

  Future<ReplyPage> fetchReplyPage({
    required String url,
  }) async {
    final data = await _replyApi.fetchReplyPage(url: url);
    final page = ReplyPage.from(data);
    return page;
  }

  String? readReply({
    required String parentId,
  }) {
    final user = _authenticationApi.state.user;

    final key = ReplyStorageKey(
      parentId: parentId,
      userId: user.id,
    );

    return _replyStorage.read(key);
  }

  Future<void> saveReply({
    required String parentId,
    required String text,
  }) async {
    final user = _authenticationApi.state.user;

    final storageKey = ReplyStorageKey(
      parentId: parentId,
      userId: user.id,
    );

    await _replyStorage.save(
      storageKey: storageKey,
      text: text,
    );
  }

  Future<void> reply(ReplyForm form) async {
    await _replyApi.reply(form.toApi());

    try {
      final commentThread = await _replyApi.fetchCommentThread(
        id: form.parentId,
      );

      final comment = _userReplyService.newestComment(commentThread);

      _controller.add(
        ReplyUpdate(
          form: form,
          comment: comment,
        ),
      );
    } catch (_) {
      // Don't throw when reply succeeds but fetchCommentThread fails
      // so the user doesn't submit a reply twice.
    }
  }
}
