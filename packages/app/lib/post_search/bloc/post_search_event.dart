import 'package:app/post_search/post_search.dart';
import 'package:equatable/equatable.dart';

sealed class PostSearchEvent extends Equatable {
  const PostSearchEvent();

  @override
  List<Object> get props => [];
}

final class PostSearchSubscriptionRequested extends PostSearchEvent {
  const PostSearchSubscriptionRequested();
}

final class PostSearchQueryChanged extends PostSearchEvent {
  const PostSearchQueryChanged(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

final class PostSearchItemPressed extends PostSearchEvent {
  const PostSearchItemPressed(this.result);

  final SearchResultModel result;

  @override
  List<Object> get props => [result];
}

final class PostSearchCleared extends PostSearchEvent {
  const PostSearchCleared();
}
