import 'package:flutter_test/flutter_test.dart';
import 'package:vote_repository/vote_repository.dart';

void main() {
  group(VotePlaceholder, () {
    test('returns $Vote', () {
      expect(
        VotePlaceholder(),
        isA<Vote>(),
      );
    });
  });
}
