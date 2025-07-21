import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:reply_repository/reply_repository.dart';

class ReplyRepository {
  ReplyRepository({
    required ReplyApi replyApi,
    required AuthenticationApi authenticationApi,
  }) : _replyApi = replyApi,
       _authenticationApi = authenticationApi;

  final ReplyApi _replyApi;
  final AuthenticationApi _authenticationApi;

  final _controller = StreamController<ReplyUpdate>.broadcast();
  Stream<ReplyUpdate> get stream => _controller.stream;

  Future<ReplyForm> fetchReplyForm({
    required String url,
  }) async {
    final data = await _replyApi.fetchReplyForm(url: url);
    final replyForm = ReplyForm.from(data);
    return replyForm;
  }

  Future<void> reply(ReplyForm form) async {
    await _replyApi.reply(
      form.toApi(),
    );

    final commentThread = await _replyApi.fetchCommentThread(
      id: form.parent,
    );

    final user = _authenticationApi.state.user;

    final userComments =
        commentThread
            .where(
              (comment) => comment.hnuser.id == user.id,
            )
            .toList()
          ..sort(
            (a, b) => b.age.compareTo(a.age),
          );

    if (userComments.isEmpty) throw Exception('No comments found after reply');

    final newUserComment = userComments.first;

    _controller.add(
      ReplyUpdate(
        form: form,
        comment: newUserComment,
      ),
    );
  }
}
