import 'dart:async';

import 'package:reply_repository/reply_repository.dart';

class ReplyRepository {
  ReplyRepository({
    required ReplyApi replyApi,
    required UserReplyService userReplyService,
  }) : _replyApi = replyApi,
       _userReplyService = userReplyService;

  final ReplyApi _replyApi;
  final UserReplyService _userReplyService;

  final _controller = StreamController<ReplyUpdate>.broadcast();
  Stream<ReplyUpdate> get stream => _controller.stream;

  Future<ReplyForm> fetchReplyForm({
    required String url,
  }) async {
    final data = await _replyApi.fetchReplyForm(url: url);
    final form = ReplyForm.from(data);
    return form;
  }

  Future<void> reply(ReplyForm form) async {
    await _replyApi.reply(form.toApi());

    try {
      final commentThread = await _replyApi.fetchCommentThread(
        id: form.parent,
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
