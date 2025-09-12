import 'package:flutter_test/flutter_test.dart';
import 'package:post_search_repository/post_search_repository.dart';

void main() {
  group(PostSearchRepository, () {
    PostSearchRepository createSubject() {
      return PostSearchRepository();
    }

    group('select', () {
      const id = 'id';

      test('emits $SelectedComment', () {
        final repository = createSubject();
        expectLater(
          repository.selectedComment,
          emits(
            isA<SelectedComment>().having(
              (comment) => comment.id,
              'id',
              id,
            ),
          ),
        );
        repository.select(id: id);
      });
    });

    group('update', () {
      const query = 'query';

      test('updates query', () {
        final repository = createSubject();
        expect(repository.query, '');
        repository.update(query: query);
        expect(repository.query, query);
      });
    });

    group('clear', () {
      test('resets query to empty string', () {
        final repository = createSubject();
        expect(repository.query, '');
        repository.update(query: 'query');
        expect(repository.query, 'query');
        repository.clear();
        expect(repository.query, '');
      });
    });

    group('dispose', () {
      test('closes controller', () {
        final repository = createSubject();
        expectLater(
          repository.selectedComment,
          emitsDone,
        );
        repository.dispose();
      });
    });
  });
}
