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
           post: postRepository.state,
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
      onData: (post) => state.copyWith(post: post),
    );
  }

  void _onTextChanged(
    CommentTextChanged event,
    Emitter<CommentState> emit,
  ) {
    emit(
      state.copyWith(
        form: state.form.copyWith(
          text: event.text,
        ),
      ),
    );
  }

  Future<void> _onSubmitted(
    CommentSubmitted event,
    Emitter<CommentState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CommentStatus.loading,
      ),
    );

    try {
      await _repository.comment(state.form);

      emit(
        state.copyWith(
          status: CommentStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          status: CommentStatus.failure,
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
