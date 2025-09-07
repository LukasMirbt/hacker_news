import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

sealed class PostSearchEvent {
  const PostSearchEvent();
}

final class PostSearchCommentListSubscriptionRequested extends PostSearchEvent {
  const PostSearchCommentListSubscriptionRequested();
}

final class PostSearchQueryChanged extends PostSearchEvent with EquatableMixin {
  const PostSearchQueryChanged(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

final class PostSearchItemPressed extends PostSearchEvent with EquatableMixin {
  const PostSearchItemPressed(this.comment);

  final Comment comment;

  @override
  List<Object> get props => [comment];
}
