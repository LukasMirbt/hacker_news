import 'package:reply_repository/reply_repository.dart';

class SavedReplyModel {
  const SavedReplyModel({
    required ReplyRepository replyRepository,
  }) : _repository = replyRepository;

  final ReplyRepository _repository;

  String? load(ReplyForm form) {
    final savedReply = _repository.readReply(
      parentId: form.parentId,
    );
    return savedReply;
  }

  void save(ReplyForm form) {
    _repository.saveReply(
      parentId: form.parentId,
      text: form.text,
    );
  }
}
