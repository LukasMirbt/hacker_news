import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

class CommentFormModel extends Equatable {
  const CommentFormModel(this.repositoryItem);

  static const empty = CommentFormModel(CommentForm.empty);

  final CommentForm repositoryItem;

  CommentForm toRepository() => repositoryItem;

  CommentFormModel copyWith({
    String? text,
  }) {
    return CommentFormModel(
      repositoryItem.copyWith(
        text: text ?? repositoryItem.text,
      ),
    );
  }

  @override
  List<Object?> get props => [repositoryItem];
}
