import 'package:app/reply_options/reply_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(ReplyOptionsState, () {
    group('from', () {
      test('returns $ReplyOptionsState', () {
        final parent = OtherUserReplyParentPlaceholder();
        expect(
          ReplyOptionsState.from(parent: parent),
          ReplyOptionsState(
            parent: ReplyParentModel(parent),
          ),
        );
      });
    });
  });
}
