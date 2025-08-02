import 'package:reply_repository/reply_repository.dart';

class SavedReplyModel {
  const SavedReplyModel({
    required ReplyRepository replyRepository,
  }) : _repository = replyRepository;

  final ReplyRepository _repository;

  String? load(String parentId) {
    final savedReply = _repository.readReply(
      parentId: parentId,
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
