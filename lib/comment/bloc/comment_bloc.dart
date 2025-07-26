import 'package:hacker_client/comment/comment.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc({
    required PostRepository postRepository,
    required SavedCommentModel savedCommentModel,
    LinkLauncher? linkLauncher,
  }) : _repository = postRepository,
       _savedCommentModel = savedCommentModel,
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         CommentState.from(
           postRepository: postRepository,
           savedCommentModel: savedCommentModel,
         ),
       ) {
    on<CommentPostSubscriptionRequested>(
      _onPostSubscriptionRequested,
    );
    on<CommentPostLoaded>(_onPostLoaded);
    on<CommentTextChanged>(_onTextChanged);
    on<CommentSubmitted>(_onSubmitted);
    on<CommentLinkPressed>(_onLinkPressed);
  }

  final LinkLauncher _linkLauncher;
  final PostRepository _repository;
  final SavedCommentModel _savedCommentModel;

  Future<void> _onPostSubscriptionRequested(
    CommentPostSubscriptionRequested event,
    Emitter<CommentState> emit,
  ) async {
    return emit.forEach(
      _repository.stream,
      onData: (repositoryState) {
        final PostRepositoryState(
          :fetchStatus,
          :post,
        ) = repositoryState;

        final updatedForm = state.form.copyWith(
          form: post.header.commentForm,
        );

        return state.copyWith(
          fetchStatus: fetchStatus,
          post: CommentPostModel(post),
          form: updatedForm,
        );
      },
    );
  }

  void _onPostLoaded(
    CommentPostLoaded event,
    Emitter<CommentState> emit,
  ) {
    emit(
      state.copyWith(
        form: state.form.copyWith(
          text: _savedCommentModel.load(),
        ),
      ),
    );
  }

  void _onTextChanged(
    CommentTextChanged event,
    Emitter<CommentState> emit,
  ) {
    final text = event.text;

    emit(
      state.copyWith(
        form: state.form.copyWith(
          text: text,
        ),
      ),
    );

    _savedCommentModel.save(text: text);
  }

  void _onLinkPressed(
    CommentLinkPressed event,
    Emitter<CommentState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }

  Future<void> _onSubmitted(
    CommentSubmitted event,
    Emitter<CommentState> emit,
  ) async {
    emit(
      state.copyWith(
        form: state.form.copyWith(
          submissionStatus: SubmissionStatus.loading,
        ),
      ),
    );

    try {
      await _repository.comment(
        state.form.toRepository(),
      );

      emit(
        state.copyWith(
          form: state.form.copyWith(
            submissionStatus: SubmissionStatus.success,
          ),
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          form: state.form.copyWith(
            submissionStatus: SubmissionStatus.failure,
          ),
        ),
      );
    }
  }
}
