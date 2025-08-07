import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:reply_repository/reply_repository.dart';

class ReplyRepository {
  ReplyRepository({
    required ReplyApi replyApi,
    required AuthenticationApi authenticationApi,
    required DraftStorage draftStorage,
    UserReplyService? userReplyService,
  }) : _replyApi = replyApi,
       _authenticationApi = authenticationApi,
       _draftStorage = draftStorage,
       _userReplyService = userReplyService ?? const UserReplyService();

  final ReplyApi _replyApi;
  final AuthenticationApi _authenticationApi;
  final DraftStorage _draftStorage;
  final UserReplyService _userReplyService;

  final _controller = StreamController<Reply>.broadcast();
  Stream<Reply> get stream => _controller.stream;

  Future<ReplyPage> fetchReplyPage({
    required String url,
  }) async {
    final data = await _replyApi.fetchReplyPage(url: url);
    final page = ReplyPage.from(data);

    final form = page.form;
    if (form == null) return page;

    final savedDraft = await _draftStorage.readReplyDraft(
      parentId: page.parent.id,
      userId: _authenticationApi.state.user.id,
    );
    if (savedDraft == null) return page;

    final pageWithDraft = page.copyWith(
      form: form.copyWith(text: savedDraft.draft),
    );

    return pageWithDraft;
  }

  Future<void> updateReply({
    required String url,
    required ReplyForm form,
    required ReplyParent parent,
  }) async {
    final user = _authenticationApi.state.user;

    await _draftStorage.saveReplyDraft(
      ReplyDraftsCompanion.insert(
        userId: user.id,
        parentId: form.parentId,
        draft: form.text,
        url: url,
        parentUserId: parent.hnuser.id,
        parentHtmlText: parent.htmlText,
      ),
    );
  }

  Future<void> reply(ReplyForm form) async {
    await _replyApi.reply(form.toApi());

    try {
      final parentId = form.parentId;

      await _draftStorage.deleteReplyDraft(
        parentId: parentId,
        userId: _authenticationApi.state.user.id,
      );

      final commentThread = await _replyApi.fetchCommentThread(id: parentId);

      final comment = _userReplyService.newestComment(commentThread);

      _controller.add(
        Reply.from(
          parentId: parentId,
          comment: comment,
        ),
      );
    } catch (_) {
      // Don't throw when reply succeeds but fetchCommentThread
      // or replyStorage.clear fails so the user doesn't submit a reply twice.
    }
  }
}
