import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart' hide ReplyPage;
import 'package:link_launcher/link_launcher.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class ReplyBloc extends Bloc<ReplyEvent, ReplyState> {
  ReplyBloc({
    required String url,
    required ReplyRepository replyRepository,
    required VoteRepository voteRepository,
    required DebouncedDraftSaver debouncedDraftSaver,
    ReplyParentVoteModel? voteModel,
    LinkLauncher? linkLauncher,
  }) : _replyRepository = replyRepository,
       _voteRepository = voteRepository,
       _debouncedDraftSaver = debouncedDraftSaver,
       _voteModel = voteModel ?? const ReplyParentVoteModel(),
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         ReplyState.initial(url: url),
       ) {
    on<ReplyVoteSubscriptionRequested>(
      _onVoteSubscriptionRequested,
    );
    on<ReplyStarted>(_onStarted);
    on<ReplyTextChanged>(_onTextChanged);
    on<ReplyParentExpansionToggled>(_onParentExpansionToggled);
    on<ReplyParentVotePressed>(_onParentVotePressed);
    on<ReplyLinkPressed>(_onLinkPressed);
    on<ReplyAppInactive>(_onAppInactive);
    on<ReplySubmitted>(_onSubmitted);
  }

  final ReplyRepository _replyRepository;
  final VoteRepository _voteRepository;
  final DebouncedDraftSaver _debouncedDraftSaver;
  final ReplyParentVoteModel _voteModel;
  final LinkLauncher _linkLauncher;

  @override
  Future<void> close() async {
    await _debouncedDraftSaver.flush();
    _debouncedDraftSaver.dispose();
    return super.close();
  }

  Future<void> _onVoteSubscriptionRequested(
    ReplyVoteSubscriptionRequested event,
    Emitter<ReplyState> emit,
  ) {
    return emit.onEach(
      _voteRepository.stream,
      onData: (repositoryState) {
        if (repositoryState is VoteSuccess) {
          emit(
            state.copyWith(
              parent: _voteModel.updateParent(
                vote: repositoryState.vote,
                parent: state.parent,
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _onStarted(
    ReplyStarted event,
    Emitter<ReplyState> emit,
  ) async {
    try {
      final page = await _replyRepository.fetchReplyPage(
        url: state.url,
      );

      emit(
        state.copyWith(
          parent: ReplyParentModel.from(page.parent),
          form: ReplyFormModel.from(page.form),
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
    final text = event.text;

    final updatedForm = state.form.copyWith(
      text: text,
    );

    emit(
      state.copyWith(
        form: updatedForm,
      ),
    );

    _debouncedDraftSaver.update(
      url: state.url,
      form: updatedForm.toRepository(),
      parent: state.parent.toRepository(),
    );
  }

  void _onParentExpansionToggled(
    ReplyParentExpansionToggled event,
    Emitter<ReplyState> emit,
  ) {
    emit(
      state.copyWith(
        parent: state.parent.copyWith(
          isExpanded: !state.parent.isExpanded,
        ),
      ),
    );
  }

  void _onParentVotePressed(
    ReplyParentVotePressed event,
    Emitter<ReplyState> emit,
  ) {
    final parent = event.parent;

    _voteRepository.vote(
      upvoteUrl: parent.upvoteUrl,
      hasBeenUpvoted: parent.hasBeenUpvoted,
    );
  }

  void _onLinkPressed(
    ReplyLinkPressed event,
    Emitter<ReplyState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }

  void _onAppInactive(
    ReplyAppInactive event,
    Emitter<ReplyState> emit,
  ) {
    _debouncedDraftSaver.flush();
  }

  Future<void> _onSubmitted(
    ReplySubmitted event,
    Emitter<ReplyState> emit,
  ) async {
    emit(
      state.copyWith(
        form: state.form.copyWith(
          submissionStatus: SubmissionStatus.loading,
        ),
      ),
    );

    try {
      await _debouncedDraftSaver.flush();

      await _replyRepository.reply(
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
