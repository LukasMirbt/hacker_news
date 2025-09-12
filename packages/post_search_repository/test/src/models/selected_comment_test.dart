import 'package:flutter_test/flutter_test.dart';
import 'package:post_search_repository/post_search_repository.dart';

void main() {
  group(SelectedComment, () {
    group('constructor', () {
      SelectedComment createSubject() => SelectedComment(id: 'id');

      test('is not equatable', () {
        final first = createSubject();
        final second = createSubject();
        expect(first == second, false);
      });
    });
  });
}
