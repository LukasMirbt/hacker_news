import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';
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
           header: postRepository.state.post.header,
         ),
       ) {
    on<CommentPostSubscriptionRequested>(
      _onPostSubscriptionRequested,
    );
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
        final header = repositoryState.post.header;
        return state.copyWith(
          fetchStatus: repositoryState.fetchStatus,
          title: header.title,
          htmlText: header.htmlText,
          form: header.commentForm?.copyWith(
            text: state.form?.text ?? '',
          ),
        );
      },
    );
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
