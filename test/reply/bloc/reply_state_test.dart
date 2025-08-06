import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';

class _MockReplyFormModel extends Mock implements ReplyFormModel {}

void main() {
  const url = 'url';

  group(ReplyState, () {
    late ReplyFormModel form;

    setUp(() {
      form = _MockReplyFormModel();
      when(() => form.isReplyingEnabled).thenReturn(false);
    });

    ReplyState createSubject({
      required FetchStatus fetchStatus,
    }) {
      return ReplyState(
        url: url,
        form: form,
        fetchStatus: fetchStatus,
        parent: OtherUserReplyParentModel.empty,
      );
    }

    group('initial', () {
      test('returns $ReplyState', () {
        expect(
          ReplyState.initial(url: url),
          ReplyState(
            url: url,
            parent: OtherUserReplyParentModel.empty,
          ),
        );
      });
    });

    group('isSubmittingEnabled', () {
      test('returns false when !fetchStatus.isSuccess', () {
        final state = createSubject(
          fetchStatus: FetchStatus.loading,
        );
        expect(state.isSubmittingEnabled, false);
      });

      test('returns false when fetchStatus.isSuccess '
          'and !form.isReplyingEnabled', () {
        final state = createSubject(
          fetchStatus: FetchStatus.success,
        );
        expect(state.isSubmittingEnabled, false);
      });

      test('returns true when fetchStatus.isSuccess '
          'and form.isReplyingEnabled', () {
        when(() => form.isReplyingEnabled).thenReturn(true);
        final state = createSubject(
          fetchStatus: FetchStatus.success,
        );
        expect(state.isSubmittingEnabled, true);
      });
    });
  });
}
