import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(ReplyPagePlaceholder, () {
    test('returns $ReplyPage', () {
      expect(
        ReplyPagePlaceholder(),
        isA<ReplyPage>(),
      );
    });
  });
}
