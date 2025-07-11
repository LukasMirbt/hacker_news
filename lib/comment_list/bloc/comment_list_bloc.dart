import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class CommentListBloc extends Bloc<CommentListEvent, CommentListState> {
  CommentListBloc({
    required String id,
    required PostRepository postRepository,
    required VoteRepository voteRepository,
    CommentListVoteModel? voteModel,
    LinkLauncher? linkLauncher,
  }) : _postRepository = postRepository,
       _voteRepository = voteRepository,
       _voteModel = voteModel ?? const CommentListVoteModel(),
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         CommentListState.initial(id: id),
       ) {
    on<CommentListSubscriptionRequested>(
      _onSubscriptionRequested,
    );
    on<CommentListVoteSubscriptionRequested>(
      _onVoteSubscriptionRequested,
    );
    on<CommentListExpansionToggled>(_onExpansionToggled);
    on<CommentListLinkPressed>(_onLinkPressed);
    on<CommentListVotePressed>(_onVotePressed);
  }

  final PostRepository _postRepository;
  final VoteRepository _voteRepository;
  final CommentListVoteModel _voteModel;
  final LinkLauncher _linkLauncher;

  Future<void> _onSubscriptionRequested(
    CommentListSubscriptionRequested event,
    Emitter<CommentListState> emit,
  ) async {
    return emit.forEach(
      _postRepository.stream,
      onData: (post) => state.copyWith(
        commentList: state.commentList.rebuildWith(post.comments),
      ),
    );
  }

  Future<void> _onVoteSubscriptionRequested(
    CommentListVoteSubscriptionRequested event,
    Emitter<CommentListState> emit,
  ) async {
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
