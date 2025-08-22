import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:reply_repository/reply_repository.dart';

class DisposedError extends StateError with EquatableMixin {
  DisposedError() : super('$ReplyDraftSaver has been disposed');

  @override
  List<Object> get props => [];
}

class ReplyDraftSaver {
  ReplyDraftSaver({
    required ReplyRepository replyRepository,
  }) : _repository = replyRepository;

  final ReplyRepository _repository;

  Timer? _debounceTimer;
  Future<void> Function()? _pendingAction;
  bool _isDisposed = false;

  void update({
    required String url,
    required ReplyForm form,
    required ReplyParent parent,
  }) {
    if (_isDisposed) throw DisposedError();

    _pendingAction = () async {
      await _repository.updateReply(
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
    if (_isDisposed) throw DisposedError();

    _debounceTimer?.cancel();
    final action = _pendingAction;
    _pendingAction = null;
    await action?.call();
  }

  void dispose() {
    if (_isDisposed) throw DisposedError();

    _debounceTimer?.cancel();
    _pendingAction = null;
    _isDisposed = true;
  }
}
