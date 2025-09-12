import 'package:app/comment_list/comment_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';
import 'package:post_search_repository/post_search_repository.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class CommentListBloc extends Bloc<CommentListEvent, CommentListState> {
  CommentListBloc({
    required String id,
    required PostRepository postRepository,
    required VoteRepository voteRepository,
    required ReplyRepository replyRepository,
    required PostSearchRepository postSearchRepository,
    required LinkLauncher linkLauncher,
    CommentListVoteModel? voteModel,
    CommentListReplyModel? replyModel,
  }) : _postRepository = postRepository,
       _voteRepository = voteRepository,
       _replyRepository = replyRepository,
       _postSearchRepository = postSearchRepository,
       _linkLauncher = linkLauncher,
       _voteModel = voteModel ?? const CommentListVoteModel(),
       _replyModel = replyModel ?? const CommentListReplyModel(),
       super(
         CommentListState.initial(id: id),
       ) {
    on<CommentListSubscriptionRequested>(
      _onSubscriptionRequested,
    );
    on<CommentListVoteSubscriptionRequested>(
      _onVoteSubscriptionRequested,
    );
    on<CommentListReplySubscriptionRequested>(
      _onReplySubscriptionRequested,
    );
    on<CommentListSelectedCommentSubscriptionRequested>(
      _onSelectedCommentSubscriptionRequested,
    );
    on<CommentListExpansionToggled>(_onExpansionToggled);
    on<CommentListLinkPressed>(_onLinkPressed);
    on<CommentListVotePressed>(_onVotePressed);
  }

  final PostRepository _postRepository;
  final VoteRepository _voteRepository;
  final ReplyRepository _replyRepository;
  final PostSearchRepository _postSearchRepository;
  final CommentListVoteModel _voteModel;
  final CommentListReplyModel _replyModel;
  final LinkLauncher _linkLauncher;

  Future<void> _onSubscriptionRequested(
    CommentListSubscriptionRequested event,
    Emitter<CommentListState> emit,
  ) {
    return emit.forEach(
      _postRepository.stream,
      onData: (repositoryState) {
        return state.copyWith(
          commentList: state.commentList.rebuildWith(
            comments: repositoryState.post.comments,
          ),
        );
      },
    );
  }

  Future<void> _onVoteSubscriptionRequested(
    CommentListVoteSubscriptionRequested event,
    Emitter<CommentListState> emit,
  ) {
    return emit.onEach(
      _voteRepository.stream,
      onData: (repositoryState) {
        if (repositoryState is VoteSuccess) {
          emit(
            state.copyWith(
              commentList: _voteModel.updateCommentList(
                vote: repositoryState.vote,
                commentList: state.commentList,
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _onReplySubscriptionRequested(
    CommentListReplySubscriptionRequested event,
    Emitter<CommentListState> emit,
  ) {
    return emit.onEach(
      _replyRepository.stream,
      onData: (reply) {
        emit(
          state.copyWith(
            commentList: _replyModel.updateCommentList(
              reply: reply,
              commentList: state.commentList,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSelectedCommentSubscriptionRequested(
    CommentListSelectedCommentSubscriptionRequested event,
    Emitter<CommentListState> emit,
  ) {
    return emit.forEach(
      _postSearchRepository.selectedComment,
      onData: (comment) {
        return state.copyWith(
          commentList: state.commentList.updateSelection(
            comment: comment,
          ),
        );
      },
    );
  }

  void _onExpansionToggled(
    CommentListExpansionToggled event,
    Emitter<CommentListState> emit,
  ) {
    emit(
      state.copyWith(
        commentList: state.commentList.toggleExpansion(
          comment: event.comment,
        ),
      ),
    );
  }

  void _onLinkPressed(
    CommentListLinkPressed event,
    Emitter<CommentListState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }

  void _onVotePressed(
    CommentListVotePressed event,
    Emitter<CommentListState> emit,
  ) {
    final comment = event.comment;

    _voteRepository.vote(
      upvoteUrl: comment.upvoteUrl,
      hasBeenUpvoted: comment.hasBeenUpvoted,
    );
  }
}
