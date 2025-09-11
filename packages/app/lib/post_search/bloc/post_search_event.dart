import 'package:app/post_search/post_search.dart';
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

final class PostSearchItemPressed extends PostSearchEvent with EquatableMixin {
  const PostSearchItemPressed(this.result);

  final SearchResultModel result;

  @override
  List<Object> get props => [result];
}
