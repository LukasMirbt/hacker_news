import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

class DisposedError extends StateError with EquatableMixin {
  DisposedError() : super('$CommentDraftSaver has been disposed');

  @override
  List<Object> get props => [];
}

class CommentDraftSaver {
  CommentDraftSaver({
    required PostRepository postRepository,
  }) : _repository = postRepository;

  final PostRepository _repository;

  Timer? _debounceTimer;
  Future<void> Function()? _pendingAction;
  bool _isDisposed = false;

  void update({
    required Post post,
    required String text,
  }) {
    if (_isDisposed) throw DisposedError();

    _pendingAction = () async {
      await _repository.updateComment(
        post: post,
        text: text,
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
