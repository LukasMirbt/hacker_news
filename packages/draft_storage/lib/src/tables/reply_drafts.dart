import 'package:clock/clock.dart';
import 'package:drift/drift.dart';

@DataClassName('ReplyDraftData')
class ReplyDrafts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get parentId => text()();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => clock.now().toUtc())();
  TextColumn get url => text()();
  TextColumn get parentUserId => text()();
  TextColumn get parentHtmlText => text()();
  TextColumn get content => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {userId, parentId},
  ];
}
