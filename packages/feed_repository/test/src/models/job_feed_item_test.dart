import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(JobFeedItem, () {
    group('from', () {
      final data = JobFeedItemDataPlaceholder();
      final titleRowData = data.titleRowData;
      final subtitleRowData = data.subtitleRowData;

      test('returns $JobFeedItem', () {
        expect(
          JobFeedItem.from(data),
          JobFeedItem(
            id: titleRowData.base.id,
            rank: titleRowData.base.rank,
            title: titleRowData.base.title,
            url: titleRowData.base.url,
            urlHost: titleRowData.base.urlHost,
            age: subtitleRowData.age,
          ),
        );
      });
    });
  });
}
