import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply_options/reply_options.dart';
import 'package:reply_repository/reply_repository.dart';

class ReplyOptionsBloc extends Bloc<void, ReplyOptionsState> {
  ReplyOptionsBloc({required ReplyParent parent})
    : super(
        ReplyOptionsState.from(parent: parent),
      );
}
