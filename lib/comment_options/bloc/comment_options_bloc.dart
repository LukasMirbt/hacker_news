import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:post_repository/post_repository.dart';
import 'package:share_launcher/share_launcher.dart';

class CommentOptionsBloc
    extends Bloc<CommentOptionsEvent, CommentOptionsState> {
  CommentOptionsBloc({
    required Comment comment,
    ShareLauncher? shareLauncher,
  }) : _shareLauncher = shareLauncher ?? ShareLauncher(),
       super(
         CommentOptionsState.from(comment),
       ) {
    on<CommentOptionsSharePressed>(_onSharePressed);
  }

  final ShareLauncher _shareLauncher;

  void _onSharePressed(
    CommentOptionsSharePressed event,
    Emitter<CommentOptionsState> emit,
  ) {
    _shareLauncher.share(
      text: state.comment.shareText,
    );
  }
}
