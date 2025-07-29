import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadCommentOptionsBloc extends Bloc<void, ThreadCommentOptionsState> {
  ThreadCommentOptionsBloc({
    required ThreadComment comment,
  }) : super(
         ThreadCommentOptionsState.from(comment),
       );
}
