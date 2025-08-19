import 'package:clock/clock.dart';
import 'package:drift/drift.dart';

@DataClassName('VisitedPostData')
class VisitedPosts extends Table {
  TextColumn get postId => text()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => clock.now().toUtc())();

  @override
  Set<Column> get primaryKey => {postId};
}
