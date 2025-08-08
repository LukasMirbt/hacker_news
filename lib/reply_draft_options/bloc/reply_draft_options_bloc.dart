import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply_draft_options/reply_draft_options.dart';

class ReplyDraftOptionsBloc
    extends Bloc<ReplyDraftOptionsEvent, ReplyDraftOptionsState> {
  ReplyDraftOptionsBloc({
    required ReplyDraft draft,
  }) : super(
         ReplyDraftOptionsState.from(draft),
       );
}
