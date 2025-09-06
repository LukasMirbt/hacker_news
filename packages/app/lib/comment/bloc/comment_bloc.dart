import 'package:app/comment/comment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc({
    required PostRepository postRepository,
    required CommentDraftSaver commentDraftSaver,
    required LinkLauncher linkLauncher,
  }) : _postRepository = postRepository,
       _draftSaver = commentDraftSaver,
       _linkLauncher = linkLauncher,
       super(
         CommentState.from(postRepository),
       ) {
    on<CommentPostSubscriptionRequested>(
      _onPostSubscriptionRequested,
    );
    on<CommentStarted>(_onStarted);
    on<CommentTextChanged>(_onTextChanged);
    on<CommentLinkPressed>(_onLinkPressed);
    on<CommentAppInactivated>(_onAppInactivated);
    on<CommentSubmitted>(_onSubmitted);
  }

  final LinkLauncher _linkLauncher;
  final PostRepository _postRepository;
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
      _postRepository.stream,
      onData: (repositoryState) {
        final header = repositoryState.post.header;
        return state.copyWith(
          fetchStatus: repositoryState.fetchStatus,
          header: CommentPostHeaderModel(header),
          form: state.form.updateWith(header.commentForm),
        );
      },
    );
  }

  Future<void> _onStarted(
    CommentStarted event,
    Emitter<CommentState> emit,
  ) async {
    final fetchStatus = state.fetchStatus;
    if (fetchStatus.isLoading) return;

    final isCommentingEnabled = state.form.isCommentingEnabled;
    if (!isCommentingEnabled) return;

    final savedComment = await _postRepository.readComment(
      parentId: state.header.id,
    );

    emit(
      state.copyWith(
        form: state.form.copyWith(
          text: savedComment,
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
      header: state.header.toRepository(),
      text: text,
    );
  }

  void _onLinkPressed(
    CommentLinkPressed event,
    Emitter<CommentState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }

  void _onAppInactivated(
    CommentAppInactivated event,
    Emitter<CommentState> emit,
  ) {
    _draftSaver.flush();
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

      await _postRepository.comment(
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
