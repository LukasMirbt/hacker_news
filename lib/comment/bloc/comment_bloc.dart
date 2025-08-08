import 'package:hacker_client/comment/comment.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc({
    required PostRepository postRepository,
    required CommentDraftSaver commentDraftSaver,
    LinkLauncher? linkLauncher,
  }) : _repository = postRepository,
       _draftSaver = commentDraftSaver,
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         CommentState.from(
           postRepository: postRepository,
         ),
       ) {
    on<CommentPostSubscriptionRequested>(
      _onPostSubscriptionRequested,
    );
    on<CommentStarted>(_onStarted);
    on<CommentTextChanged>(_onTextChanged);
    on<CommentSubmitted>(_onSubmitted);
    on<CommentLinkPressed>(_onLinkPressed);
  }

  final LinkLauncher _linkLauncher;
  final PostRepository _repository;
  final CommentDraftSaver _draftSaver;

  @override
  Future<void> close() async {
    await _draftSaver.flush();
    _draftSaver.dispose();
    return super.close();
  }

  Future<void> _onPostSubscriptionRequested(
    CommentPostSubscriptionRequested event,
    Emitter<CommentState> emit,
  ) async {
    return emit.forEach(
      _repository.stream,
      onData: (repositoryState) {
        final post = repositoryState.post;
        final fetchStatus = repositoryState.fetchStatus;
        final form = post.header.commentForm;

        final updatedForm = state.form.copyWith(
          form: form,
          text: form?.text ?? state.form.text,
        );

        return state.copyWith(
          fetchStatus: fetchStatus,
          post: CommentPostModel(post),
          form: updatedForm,
        );
      },
    );
  }

  Future<void> _onStarted(
    CommentStarted event,
    Emitter<CommentState> emit,
  ) async {
    final post = state.post.toRepository();
    final form = post.header.commentForm;
    if (form == null) return;

    final savedDraft = await _repository.readComment(
      postId: form.parentId,
    );

    emit(
      state.copyWith(
        form: state.form.copyWith(
          text: savedDraft,
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

    _draftSaver.update(
      post: state.post.toRepository(),
      text: text,
    );
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
      await _draftSaver.flush();

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
