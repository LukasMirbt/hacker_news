import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:post_repository/post_repository.dart';

class PostRepository extends Cubit<PostRepositoryState> {
  PostRepository({
    required PostApi postApi,
    CancelTokenService? cancelTokenService,
  }) : _api = postApi,
       _cancelTokenService = cancelTokenService ?? CancelTokenService(),
       super(
         PostRepositoryState(),
       );

  final PostApi _api;
  final CancelTokenService _cancelTokenService;

  Future<void> fetchPostStream({required String id}) async {
    final cancelToken = _cancelTokenService.generate();

    try {
      final stream = _api.fetchPostStream(
        id: id,
        cancelToken: cancelToken,
      );

      await for (final data in stream) {
        emit(
          state.copyWith(
            post: Post.from(data),
            fetchStatus: FetchStatus.success,
          ),
        );
      }
    } catch (_) {
      emit(
        state.copyWith(
          fetchStatus: FetchStatus.failure,
        ),
      );
      rethrow;
    }
  }

  Future<void> refreshPost({required String id}) async {
    emit(
      state.copyWith(
        refreshStatus: RefreshStatus.loading,
      ),
    );

    final cancelToken = _cancelTokenService.generate();

    try {
      final data = await _api.fetchPost(
        id: id,
        cancelToken: cancelToken,
      );

      emit(
        state.copyWith(
          post: Post.from(data),
          refreshStatus: RefreshStatus.success,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          refreshStatus: RefreshStatus.failure,
          fetchStatus: FetchStatus.failure,
        ),
      );
      rethrow;
    }
  }

  Future<void> comment(CommentForm form) async {
    await _api.comment(form.toApi());

    final cancelToken = _cancelTokenService.generate();

    try {
      final data = await _api.fetchPost(
        id: form.parent,
        cancelToken: cancelToken,
      );

      emit(
        state.copyWith(
          post: Post.from(data),
          fetchStatus: FetchStatus.success,
        ),
      );
    } catch (_) {
      // Don't throw when comment succeeds but fetchPost fails
      // so the user doesn't submit comments twice.

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.failure,
        ),
      );
    }
  }
}
