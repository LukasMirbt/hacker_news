import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:reply_repository/reply_repository.dart';

class ReplyBloc extends Bloc<ReplyEvent, ReplyState> {
  ReplyBloc({
    required String url,
    required ReplyRepository replyRepository,
    LinkLauncher? linkLauncher,
  }) : _repository = replyRepository,
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         ReplyState.initial(url: url),
       ) {
    on<ReplyStarted>(_onStarted);
    on<ReplyTextChanged>(_onTextChanged);
    on<ReplyLinkPressed>(_onLinkPressed);
    on<ReplySubmitted>(_onSubmitted);
  }

  final LinkLauncher _linkLauncher;
  final ReplyRepository _repository;

  Future<void> _onStarted(
    ReplyStarted event,
    Emitter<ReplyState> emit,
  ) async {
    try {
      // TODO: Handle replying being disabled

      final form = await _repository.fetchReplyForm(
        url: state.url,
      );

      emit(
        state.copyWith(
          form: form,
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
    ReplyTextChanged event,
    Emitter<ReplyState> emit,
  ) {
    emit(
      state.copyWith(
        form: state.form.copyWith(
          text: event.text,
        ),
      ),
    );
  }

  void _onLinkPressed(
    ReplyLinkPressed event,
    Emitter<ReplyState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }

  Future<void> _onSubmitted(
    ReplySubmitted event,
    Emitter<ReplyState> emit,
  ) async {
    emit(
      state.copyWith(
        submissionStatus: SubmissionStatus.loading,
      ),
    );

    try {
      await _repository.reply(state.form);

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
