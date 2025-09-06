import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_launcher/share_launcher.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadCommentOptionsBloc
    extends Bloc<ThreadCommentOptionsEvent, ThreadCommentOptionsState> {
  ThreadCommentOptionsBloc({
    required ThreadComment comment,
    ShareLauncher? shareLauncher,
  }) : _shareLauncher = shareLauncher ?? ShareLauncher(),
       super(
         ThreadCommentOptionsState.from(comment),
       ) {
    on<ThreadCommentOptionsSharePressed>(_onSharePressed);
  }

  final ShareLauncher _shareLauncher;

  void _onSharePressed(
    ThreadCommentOptionsSharePressed event,
    Emitter<ThreadCommentOptionsState> emit,
  ) {
    _shareLauncher.share(
      text: state.comment.shareText,
    );
  }
}
