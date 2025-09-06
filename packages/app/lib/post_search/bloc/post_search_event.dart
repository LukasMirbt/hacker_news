import 'package:equatable/equatable.dart';

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
