import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

class ReplyFormModel extends Equatable {
  const ReplyFormModel(ReplyForm replyForm) : _form = replyForm;

  static final empty = ReplyFormModel(ReplyForm.empty);

  final ReplyForm _form;

  String get user => _form.hnuser.id;
  String? get htmlText => _form.htmlText;

  ReplyForm toRepository() => _form;

  @override
  List<Object?> get props => [_form];
}
