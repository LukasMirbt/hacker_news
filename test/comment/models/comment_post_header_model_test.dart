import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostHeader extends Mock implements PostHeader {}

void main() {
  group(CommentPostHeaderModel, () {
    late PostHeader header;

    setUp(() {
      header = _MockPostHeader();
    });

    CommentPostHeaderModel createSubject() {
      return CommentPostHeaderModel(header);
    }

    group('id', () {
      test('returns header.id', () {
        const id = 'id';
        when(() => header.id).thenReturn(id);
        final model = createSubject();
        expect(model.id, id);
      });
    });

    group('title', () {
      test('returns header.title', () {
        const title = 'title';
        when(() => header.title).thenReturn(title);
        final model = createSubject();
        expect(model.title, title);
      });
    });

    group('htmlText', () {
      test('returns header.htmlText', () {
        const htmlText = 'htmlText';
        when(() => header.htmlText).thenReturn(htmlText);
        final model = createSubject();
        expect(model.htmlText, htmlText);
      });
    });

    group('toRepository', () {
      test('returns header', () {
        final model = createSubject();
        expect(model.toRepository(), header);
      });
    });
  });
}
