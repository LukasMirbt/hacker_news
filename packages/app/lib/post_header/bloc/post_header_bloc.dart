import 'package:app/post_header/post_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';
import 'package:share_launcher/share_launcher.dart';
import 'package:vote_repository/vote_repository.dart';

class PostHeaderBloc extends Bloc<PostHeaderEvent, PostHeaderState> {
  PostHeaderBloc({
    required String id,
    required PostRepository postRepository,
    required VoteRepository voteRepository,
    required LinkLauncher linkLauncher,
    PostHeaderVoteModel? voteModel,
    ShareLauncher? shareLauncher,
  }) : _postRepository = postRepository,
       _voteRepository = voteRepository,
       _linkLauncher = linkLauncher,
       _voteModel = voteModel ?? const PostHeaderVoteModel(),
       _shareLauncher = shareLauncher ?? ShareLauncher(),
       super(
         PostHeaderState.initial(
           id: id,
           visitedPosts: postRepository.readVisitedPosts(),
         ),
       ) {
    on<PostHeaderSubscriptionRequested>(
      _onSubscriptionRequested,
    );
    on<PostHeaderVoteSubscriptionRequested>(
      _onVoteSubscriptionRequested,
    );
    on<PostHeaderVisitedPostSubscriptionRequested>(
      _onVisitedPostSubscriptionRequested,
    );
    on<PostHeaderPressed>(_onPressed);
    on<PostHeaderVotePressed>(_onVotePressed);
    on<PostHeaderSharePressed>(_onSharePressed);
    on<PostHeaderTextLinkPressed>(_onTextLinkPressed);
  }

  final PostRepository _postRepository;
  final VoteRepository _voteRepository;
  final PostHeaderVoteModel _voteModel;
  final LinkLauncher _linkLauncher;
  final ShareLauncher _shareLauncher;

  Future<void> _onSubscriptionRequested(
    PostHeaderSubscriptionRequested event,
    Emitter<PostHeaderState> emit,
  ) {
    return emit.forEach(
      _postRepository.stream,
      onData: (repositoryState) => state.copyWith(
        header: PostHeaderModel(repositoryState.post.header),
      ),
    );
  }

  Future<void> _onVoteSubscriptionRequested(
    PostHeaderVoteSubscriptionRequested event,
    Emitter<PostHeaderState> emit,
  ) {
    return emit.onEach(
      _voteRepository.stream,
      onData: (repositoryState) {
        if (repositoryState is VoteSuccess) {
          emit(
            state.copyWith(
              header: _voteModel.updateHeader(
                vote: repositoryState.vote,
                header: state.header,
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _onVisitedPostSubscriptionRequested(
    PostHeaderVisitedPostSubscriptionRequested event,
    Emitter<PostHeaderState> emit,
  ) {
    return emit.onEach(
      _postRepository.visitedPosts,
      onData: (visitedPosts) {
        emit(
          state.copyWith(
            visitedPosts: visitedPosts,
          ),
        );
      },
    );
  }

  void _onPressed(
    PostHeaderPressed event,
    Emitter<PostHeaderState> emit,
  ) {
    final header = state.header;
    _linkLauncher.launch(header.url);
    _postRepository.addVisitedPost(header.id);
  }

  void _onVotePressed(
    PostHeaderVotePressed event,
    Emitter<PostHeaderState> emit,
  ) {
    final header = state.header;

    _voteRepository.vote(
      upvoteUrl: header.upvoteUrl,
      hasBeenUpvoted: header.hasBeenUpvoted,
    );
  }

  void _onSharePressed(
    PostHeaderSharePressed event,
    Emitter<PostHeaderState> emit,
  ) {
    _shareLauncher.share(text: event.text);
  }

  void _onTextLinkPressed(
    PostHeaderTextLinkPressed event,
    Emitter<PostHeaderState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }
}
