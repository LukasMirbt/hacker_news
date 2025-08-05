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

    final storageKey = ReplyStorageKey(
      parentId: page.parent.id,
      userId: _authenticationApi.state.user.id,
    );

    final form = page.form;
    if (form == null) return page;

    final savedReply = _replyStorage.read(storageKey);
    if (savedReply == null) return page;

    final pageWithDraft = page.copyWith(
      form: form.copyWith(text: savedReply),
    );

    return pageWithDraft;
  }

  Future<void> updateReply(ReplyForm form) async {
    final user = _authenticationApi.state.user;

    final key = ReplyStorageKey(
      parentId: form.parentId,
      userId: user.id,
    );

    await _replyStorage.save(
      storageKey: key,
      text: form.text,
    );
  }

  Future<void> reply(ReplyForm form) async {
    await _replyApi.reply(form.toApi());

    // TODO: Investigate issue with replies

    /*     flutter:
flutter: ╔╣ Request ║ POST
flutter: ║  https://news.ycombinator.com/comment
flutter: ╚══════════════════════════════════════════════════════════════════════════════════════════╝
flutter:
flutter: ╔╣ Response ║ POST ║ Status: 302 Found  ║ Time: 199 ms
flutter: ║  https://news.ycombinator.com/comment
flutter: ╚══════════════════════════════════════════════════════════════════════════════════════════╝
flutter:
flutter: ╔╣ Request ║ GET
flutter: ║  https://news.ycombinator.com/item
flutter: ╚══════════════════════════════════════════════════════════════════════════════════════════╝
flutter:
flutter: ╔╣ DioError ║ DioExceptionType.unknown
flutter: ║  null
flutter: ╚═════ */

    try {
      final storageKey = ReplyStorageKey(
        parentId: form.parentId,
        userId: _authenticationApi.state.user.id,
      );

      await _replyStorage.clear(storageKey);

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
      // Don't throw when reply succeeds but fetchCommentThread
      // or replyStorage.clear fails so the user doesn't submit a reply twice.
    }
  }
}
