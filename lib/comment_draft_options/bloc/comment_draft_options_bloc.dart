import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_draft_options/comment_draft_options.dart';

class CommentDraftOptionsBloc extends Bloc<void, CommentDraftOptionsState> {
  CommentDraftOptionsBloc({
    required CommentDraft draft,
  }) : super(
         CommentDraftOptionsState.from(draft),
       );
}
