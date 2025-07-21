import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';

class CommentFormBloc extends Bloc<CommentFormEvent, CommentFormState> {
  CommentFormBloc({
    required PostRepository postRepository,
    LinkLauncher? linkLauncher,
  }) : _repository = postRepository,
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         CommentFormState.initial(
           post: postRepository.state,
         ),
       ) {
    on<CommentFormPostSubscriptionRequested>(
      _onPostSubscriptionRequested,
    );
    on<CommentFormTextChanged>(_onTextChanged);
    on<CommentFormSubmitted>(_onSubmitted);
    on<CommentFormLinkPressed>(_onLinkPressed);
  }

  final LinkLauncher _linkLauncher;
  final PostRepository _repository;

  Future<void> _onPostSubscriptionRequested(
    CommentFormPostSubscriptionRequested event,
    Emitter<CommentFormState> emit,
  ) async {
    return emit.forEach(
      _repository.stream,
      onData: (post) => state.copyWith(post: post),
    );
  }

  void _onTextChanged(
    CommentFormTextChanged event,
    Emitter<CommentFormState> emit,
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
    CommentFormSubmitted event,
    Emitter<CommentFormState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CommentFormStatus.loading,
      ),
    );

    try {
      await _repository.comment(
        state.form.toRepository(),
      );

      emit(
        state.copyWith(
          status: CommentFormStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          status: CommentFormStatus.failure,
        ),
      );
    }
  }

  void _onLinkPressed(
    CommentFormLinkPressed event,
    Emitter<CommentFormState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }
}
