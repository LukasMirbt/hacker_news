import 'package:drift/drift.dart';

class ReplyDrafts extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  TextColumn get url => text()();
  TextColumn get parentUser => text()();
  TextColumn get parentText => text()();
  TextColumn get draft => text()();
}
