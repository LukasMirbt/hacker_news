import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:bloc/bloc.dart';
import 'package:post_repository/post_repository.dart';

class PostRepository extends Cubit<PostRepositoryState> {
  PostRepository({
    required PostApi postApi,
    required AuthenticationApi authenticationApi,
    required CommentStorage commentStorage,
    CancelTokenService? cancelTokenService,
  }) : _postApi = postApi,
       _authenticationApi = authenticationApi,
       _commentStorage = commentStorage,
       _cancelTokenService = cancelTokenService ?? CancelTokenService(),
       super(
         PostRepositoryState.initial(),
       );

  final PostApi _postApi;
  final AuthenticationApi _authenticationApi;
  final CommentStorage _commentStorage;
  final CancelTokenService _cancelTokenService;

  Future<void> fetchPostStream({required String id}) async {
    final cancelToken = _cancelTokenService.generate();

    try {
      final stream = _postApi.fetchPostStream(
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
      final data = await _postApi.fetchPost(
        id: id,
        cancelToken: cancelToken,
      );

      emit(
        state.copyWith(
          post: Post.from(data),
          refreshStatus: RefreshStatus.success,
          fetchStatus: FetchStatus.success,
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

  String? readComment({required String parentId}) {
    final user = _authenticationApi.state.user;
    final storageKey = CommentStorageKey(
      parentId: parentId,
      userId: user.id,
    );
    final savedComment = _commentStorage.read(storageKey);
    return savedComment;
  }

  Future<void> saveComment({
    required String parentId,
    required String text,
  }) async {
    final user = _authenticationApi.state.user;

    final storageKey = CommentStorageKey(
      parentId: parentId,
      userId: user.id,
    );

    await _commentStorage.save(
      storageKey: storageKey,
      text: text,
    );
  }

  Future<void> comment(CommentForm form) async {
    await _postApi.comment(form.toApi());

    final cancelToken = _cancelTokenService.generate();

    try {
      final data = await _postApi.fetchPost(
        id: form.parentId,
        cancelToken: cancelToken,
      );

      final userId = _authenticationApi.state.user.id;

      final storageKey = CommentStorageKey(
        parentId: form.parentId,
        userId: userId,
      );

      await _commentStorage.clear(storageKey);

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
