import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:bloc/bloc.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:post_repository/post_repository.dart';

class PostRepository extends Cubit<PostRepositoryState> {
  PostRepository({
    required PostApi postApi,
    required AuthenticationApi authenticationApi,
    required DraftStorage draftStorage,
    CancelTokenService? cancelTokenService,
  }) : _postApi = postApi,
       _authenticationApi = authenticationApi,
       _draftStorage = draftStorage,
       _cancelTokenService = cancelTokenService ?? CancelTokenService(),
       super(
         PostRepositoryState.initial(),
       );

  final PostApi _postApi;
  final AuthenticationApi _authenticationApi;
  final DraftStorage _draftStorage;
  final CancelTokenService _cancelTokenService;

  Future<void> fetchPostStream({required String id}) async {
    final cancelToken = _cancelTokenService.generate();

    try {
      final stream = _postApi.fetchPostStream(
        id: id,
        cancelToken: cancelToken,
      );

      await for (final data in stream) {
        CommentDraftData? savedDraft;

        if (state.fetchStatus.isLoading) {
          savedDraft = await _draftStorage.readCommentDraft(
            CommentDraftByUniqueKeys(
              postId: id,
              userId: _authenticationApi.state.user.id,
            ),
          );
        }

        final post = Post.from(
          data,
          savedComment: savedDraft?.content,
        );

        emit(
          state.copyWith(
            post: post,
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

  Future<String?> readComment({
    required String postId,
  }) async {
    final user = _authenticationApi.state.user;

    final draft = await _draftStorage.readCommentDraft(
      CommentDraftByUniqueKeys(
        postId: postId,
        userId: user.id,
      ),
    );
    if (draft == null) return null;

    return draft.content;
  }

  Future<void> updateComment({
    required PostHeader header,
    required String text,
  }) async {
    if (text.trim().isEmpty) {
      await _draftStorage.deleteCommentDraft(
        CommentDraftByUniqueKeys(
          postId: header.id,
          userId: _authenticationApi.state.user.id,
        ),
      );
      return;
    }

    final user = _authenticationApi.state.user;

    await _draftStorage.saveCommentDraft(
      CommentDraftsCompanion.insert(
        userId: user.id,
        postId: header.id,
        content: text,
        postUserId: header.hnuser?.id ?? '',
        postTitle: header.title,
      ),
    );
  }

  Future<void> comment(CommentForm form) async {
    await _postApi.comment(form.toApi());

    final cancelToken = _cancelTokenService.generate();

    try {
      final parentId = form.parentId;

      final data = await _postApi.fetchPost(
        id: parentId,
        cancelToken: cancelToken,
      );

      final userId = _authenticationApi.state.user.id;

      await _draftStorage.deleteCommentDraft(
        CommentDraftByUniqueKeys(
          postId: parentId,
          userId: userId,
        ),
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
