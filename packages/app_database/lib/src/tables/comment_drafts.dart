import 'package:drift/drift.dart';

class CommentDraftTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  TextColumn get postId => text()();
  TextColumn get postUser => text()();
  TextColumn get postTitle => text()();
  TextColumn get draft => text()();
}
