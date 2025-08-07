import 'package:drift/drift.dart';

@DataClassName('ReplyDraftData')
class ReplyDrafts extends Table {
  TextColumn get userId => text()();
  TextColumn get parentId => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  TextColumn get url => text()();
  TextColumn get parentUserId => text()();
  TextColumn get parentHtmlText => text()();
  TextColumn get draft => text()();

  @override
  Set<Column> get primaryKey => {userId, parentId};
}
