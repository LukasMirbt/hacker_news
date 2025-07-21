import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadItemOptionsBloc extends Bloc<void, ThreadItemOptionsState> {
  ThreadItemOptionsBloc({
    required ThreadFeedItem item,
  }) : super(
         ThreadItemOptionsState.from(item),
       );
}
