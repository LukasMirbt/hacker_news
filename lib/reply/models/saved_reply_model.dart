import 'package:reply_repository/reply_repository.dart';

class SavedReplyModel {
  const SavedReplyModel({
    required ReplyRepository replyRepository,
  }) : _repository = replyRepository;

  final ReplyRepository _repository;

  Future<String?> load(String parentId) async {
    final savedReply = _repository.readReply(parentId: parentId);
    return savedReply;
  }

  Future<void> save(ReplyForm form) async {
    await _repository.saveReply(
      parentId: form.parentId,
      text: form.text,
    );
  }

  Future<void> clear(ReplyForm form) async {
    await _repository.deleteReply(
      parentId: form.parentId,
    );
  }
}
