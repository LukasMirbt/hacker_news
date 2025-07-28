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
    required SavedReplyModel savedReplyModel,
    ReplyParentVoteModel? voteModel,
    LinkLauncher? linkLauncher,
  }) : _replyRepository = replyRepository,
       _voteRepository = voteRepository,
       _savedReplyModel = savedReplyModel,
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
    on<ReplySubmitted>(_onSubmitted);
  }

  final ReplyRepository _replyRepository;
  final VoteRepository _voteRepository;
  final SavedReplyModel _savedReplyModel;
  final ReplyParentVoteModel _voteModel;
  final LinkLauncher _linkLauncher;

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

      final parent = page.parent;
      final form = page.form;
      final savedReply = _savedReplyModel.load(form);

      emit(
        state.copyWith(
          parent: ReplyParentModel(
            parent: parent,
          ),
          form: ReplyFormModel(
            form: form,
            text: savedReply,
          ),
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

    _savedReplyModel.save(
      updatedForm.toRepository(),
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
    _voteRepository.vote(
      upvoteUrl: state.parent.upvoteUrl,
      hasBeenUpvoted: state.parent.hasBeenUpvoted,
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
        form: state.form.copyWith(
          submissionStatus: SubmissionStatus.loading,
        ),
      ),
    );

    try {
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
