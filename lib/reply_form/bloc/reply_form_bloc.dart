import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply_form/reply_form.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';

class ReplyFormBloc extends Bloc<ReplyFormEvent, ReplyFormState> {
  ReplyFormBloc({
    required String commentId,
    required PostRepository postRepository,
    LinkLauncher? linkLauncher,
  }) : _repository = postRepository,
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         ReplyFormState.initial(
           commentId: commentId,
           post: postRepository.state,
         ),
       ) {
    on<ReplyFormStarted>(_onStarted);
    on<ReplyFormTextChanged>(_onTextChanged);
    on<ReplyFormLinkPressed>(_onLinkPressed);
    on<ReplyFormSubmitted>(_onSubmitted);
  }

  final LinkLauncher _linkLauncher;
  final PostRepository _repository;

  Future<void> _onStarted(
    ReplyFormStarted event,
    Emitter<ReplyFormState> emit,
  ) async {
    try {
      final replyForm = await _repository.fetchReplyForm(
        post: state.post,
        commentId: state.commentId,
      );

      emit(
        state.copyWith(
          replyForm: ReplyFormModel(replyForm),
          fetchStatus: FetchStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          fetchStatus: FetchStatus.failure,
        ),
      );
    }
  }

  void _onTextChanged(
    ReplyFormTextChanged event,
    Emitter<ReplyFormState> emit,
  ) {
    emit(
      state.copyWith(
        text: event.text,
      ),
    );
  }

  void _onLinkPressed(
    ReplyFormLinkPressed event,
    Emitter<ReplyFormState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }

  Future<void> _onSubmitted(
    ReplyFormSubmitted event,
    Emitter<ReplyFormState> emit,
  ) async {
    emit(
      state.copyWith(
        submissionStatus: SubmissionStatus.loading,
      ),
    );

    try {
      await _repository.reply(
        post: state.post,
        replyForm: state.replyForm.toRepository(),
        text: state.text,
      );

      emit(
        state.copyWith(
          submissionStatus: SubmissionStatus.success,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          submissionStatus: SubmissionStatus.failure,
        ),
      );
    }
  }
}
