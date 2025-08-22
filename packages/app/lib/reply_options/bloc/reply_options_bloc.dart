import 'package:app/reply_options/reply_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:share_launcher/share_launcher.dart';

class ReplyOptionsBloc extends Bloc<ReplyOptionsEvent, ReplyOptionsState> {
  ReplyOptionsBloc({
    required ReplyParent parent,
    ShareLauncher? shareLauncher,
  }) : _shareLauncher = shareLauncher ?? ShareLauncher(),
       super(
         ReplyOptionsState.from(parent: parent),
       ) {
    on<ReplyOptionsSharePressed>(_onSharePressed);
  }

  final ShareLauncher _shareLauncher;

  void _onSharePressed(
    ReplyOptionsSharePressed event,
    Emitter<ReplyOptionsState> emit,
  ) {
    _shareLauncher.share(
      text: state.parent.shareText,
    );
  }
}
