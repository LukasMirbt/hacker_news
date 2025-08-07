import 'dart:async';

import 'package:reply_repository/reply_repository.dart';

class DebouncedDraftSaver {
  DebouncedDraftSaver({
    required ReplyRepository replyRepository,
  }) : _replyRepository = replyRepository;

  final ReplyRepository _replyRepository;

  Timer? _debounceTimer;
  Future<void> Function()? _pendingAction;

  void update({
    required String url,
    required ReplyForm form,
    required ReplyParent parent,
  }) {
    _pendingAction = () async {
      await _replyRepository.updateReply(
        url: url,
        form: form,
        parent: parent,
      );
    };

    _debounceTimer?.cancel();

    _debounceTimer = Timer(
      const Duration(milliseconds: 500),
      () {
        _pendingAction?.call();
        _pendingAction = null;
      },
    );
  }

  Future<void> flush() async {
    _debounceTimer?.cancel();
    final action = _pendingAction;
    _pendingAction = null;
    await action?.call();
  }

  void dispose() {
    _debounceTimer?.cancel();
    _pendingAction = null;
  }
}
