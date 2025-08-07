import 'package:drift/drift.dart';

@DataClassName('CommentDraftData')
class CommentDrafts extends Table {
  TextColumn get userId => text()();
  TextColumn get postId => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  TextColumn get postUserId => text()();
  TextColumn get postTitle => text()();
  TextColumn get draft => text()();

  @override
  Set<Column> get primaryKey => {userId, postId};
}
