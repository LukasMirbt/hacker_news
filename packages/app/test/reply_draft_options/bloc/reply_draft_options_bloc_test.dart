import 'package:app/reply_draft_options/reply_draft_options.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final draft = ReplyDraftPlaceholder();

  group(ReplyDraftOptionsBloc, () {
    ReplyDraftOptionsBloc buildBloc() {
      return ReplyDraftOptionsBloc(draft: draft);
    }

    test('initial state is $ReplyDraftOptionsState', () {
      expect(
        buildBloc().state,
        ReplyDraftOptionsState.from(draft),
      );
    });
  });
}
