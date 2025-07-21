import 'package:equatable/equatable.dart';
import 'package:reply_repository/reply_repository.dart';

class ReplyFormModel extends Equatable {
  const ReplyFormModel(this.repositoryItem);

  static final empty = ReplyFormModel(ReplyForm.empty);

  final ReplyForm repositoryItem;

  String get user => repositoryItem.hnuser.id;
  String? get htmlText => repositoryItem.htmlText;

  ReplyForm toRepository() => repositoryItem;

  ReplyFormModel copyWith({
    String? text,
  }) {
    return ReplyFormModel(
      repositoryItem.copyWith(
        text: text ?? repositoryItem.text,
      ),
    );
  }

  @override
  List<Object?> get props => [repositoryItem];
}
