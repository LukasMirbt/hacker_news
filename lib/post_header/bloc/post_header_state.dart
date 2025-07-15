import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/post_header/post_header.dart';

part 'post_header_state.freezed.dart';

@freezed
abstract class PostHeaderState with _$PostHeaderState {
  const factory PostHeaderState({
    required String id,
    required PostHeaderModel header,
    required Set<String> visitedPosts,
  }) = _PostHeaderState;

  factory PostHeaderState.initial({
    required String id,
    required Set<String> visitedPosts,
  }) {
    return PostHeaderState(
      id: id,
      visitedPosts: visitedPosts,
      header: PostHeaderModelPlaceholder(),
    );
  }

  const PostHeaderState._();

  bool get hasBeenVisited => visitedPosts.contains(id);
}
