import 'package:hacker_client/comment/comment.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc({
    required PostRepository postRepository,
    LinkLauncher? linkLauncher,
  }) : _repository = postRepository,
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         CommentState.initial(
           fetchStatus: postRepository.state.fetchStatus,
           post: postRepository.state.post,
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

  Future<void> _onPostSubscriptionRequested(
    CommentPostSubscriptionRequested event,
    Emitter<CommentState> emit,
  ) async {
    return emit.forEach(
      _repository.stream,
      onData: (repositoryState) {
        var text = state.form?.text ?? '';

        if (state.post == Post.empty && repositoryState.post != Post.empty) {
          text =
              _repository.readComment(
                postId: repositoryState.post.header.id,
              ) ??
              text;
        }

        final header = repositoryState.post.header;

        return state.copyWith(
          fetchStatus: repositoryState.fetchStatus,
          post: repositoryState.post,
          form: header.commentForm?.copyWith(
            text: text,
          ),
        );
      },
    );
  }

  void _onStarted(
    CommentStarted event,
    Emitter<CommentState> emit,
  ) {
    if (_repository.state.post != Post.empty) {
      final text = _repository.readComment(
        postId: _repository.state.post.header.id,
      );

      emit(
        state.copyWith(
          form: state.form?.copyWith(text: text ?? ''),
        ),
      );
    }
  }

  void _onTextChanged(
    CommentTextChanged event,
    Emitter<CommentState> emit,
  ) {
    final form = state.form;
    if (form == null) return;

    emit(
      state.copyWith(
        form: form.copyWith(
          text: event.text,
        ),
      ),
    );

    _repository.saveComment(
      postId: form.parent,
      text: event.text,
    );
  }

  Future<void> _onSubmitted(
    CommentSubmitted event,
    Emitter<CommentState> emit,
  ) async {
    final form = state.form;
    if (form == null) return;

    emit(
      state.copyWith(
        submissionStatus: CommentStatus.loading,
      ),
    );

    try {
      await _repository.comment(form);

      emit(
        state.copyWith(
          submissionStatus: CommentStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          submissionStatus: CommentStatus.failure,
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
