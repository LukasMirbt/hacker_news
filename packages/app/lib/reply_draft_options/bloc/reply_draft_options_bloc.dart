import 'package:app/reply_draft_options/reply_draft_options.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplyDraftOptionsBloc extends Bloc<void, ReplyDraftOptionsState> {
  ReplyDraftOptionsBloc({
    required ReplyDraft draft,
  }) : super(
         ReplyDraftOptionsState.from(draft),
       );
}
