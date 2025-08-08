import 'package:drift/drift.dart';

@DataClassName('CommentDraftData')
class CommentDrafts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get postId => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  TextColumn get postUserId => text()();
  TextColumn get postTitle => text()();
  TextColumn get content => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {userId, postId},
  ];
}
