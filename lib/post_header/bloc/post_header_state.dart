import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/post_header/post_header.dart';

part 'post_header_state.freezed.dart';

@freezed
abstract class PostHeaderState with _$PostHeaderState {
  const factory PostHeaderState({
    required String id,
    required PostHeaderModel header,
  }) = _PostHeaderState;

  factory PostHeaderState.initial({
    required String id,
  }) {
    return PostHeaderState(
      id: id,
      header: PostHeaderModelPlaceholder(),
    );
  }
}
