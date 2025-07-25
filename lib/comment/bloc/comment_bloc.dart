import 'package:hacker_client/comment/comment.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc({
    required PostRepository postRepository,
    required SavedCommentForm savedCommentForm,
    LinkLauncher? linkLauncher,
  }) : _repository = postRepository,
       _savedCommentForm = savedCommentForm,
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         CommentState(
           fetchStatus: postRepository.state.fetchStatus,
           post: postRepository.state.post,
           form: savedCommentForm.load(),
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
  final SavedCommentForm _savedCommentForm;

  Future<void> _onPostSubscriptionRequested(
    CommentPostSubscriptionRequested event,
    Emitter<CommentState> emit,
  ) async {
    return emit.forEach(
      _repository.stream,
      onData: (repositoryState) {
        final post = repositoryState.post;
        return state.copyWith(
          fetchStatus: repositoryState.fetchStatus,
          post: post,
          form: state.form.updateWith(
            form: post.header.commentForm,
          ),
        );
      },
    );
  }

  Future<void> _onPostLoaded(
    CommentPostLoaded event,
    Emitter<CommentState> emit,
  ) async {
    emit(
      state.copyWith(
        form: _savedCommentForm.load(),
      ),
    );
  }

  void _onTextChanged(
    CommentTextChanged event,
    Emitter<CommentState> emit,
  ) {
    final updatedForm = state.form.copyWith(
      text: event.text,
    );

    emit(
      state.copyWith(
        form: updatedForm,
      ),
    );

    _savedCommentForm.save(updatedForm);
  }

  Future<void> _onSubmitted(
    CommentSubmitted event,
    Emitter<CommentState> emit,
  ) async {
    final form = state.form.toRepository();
    if (form == null) return;

    emit(
      state.copyWith(
        form: state.form.copyWith(
          submissionStatus: SubmissionStatus.loading,
        ),
      ),
    );

    try {
      await _repository.comment(form);

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

  void _onLinkPressed(
    CommentLinkPressed event,
    Emitter<CommentState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }
}
