import 'package:app/comment_draft_options/comment_draft_options.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final draft = CommentDraftPlaceholder();

  group(CommentDraftOptionsBloc, () {
    CommentDraftOptionsBloc buildBloc() {
      return CommentDraftOptionsBloc(draft: draft);
    }

    test('initial state is $CommentDraftOptionsState', () {
      expect(
        buildBloc().state,
        CommentDraftOptionsState.from(draft),
      );
    });
  });
}
