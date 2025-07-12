import 'package:freezed_annotation/freezed_annotation.dart';

part 'visited_post_state.freezed.dart';
part 'visited_post_state.g.dart';

@freezed
abstract class VisitedPostState with _$VisitedPostState {
  const factory VisitedPostState({
    @Default({}) Set<String> items,
  }) = _VisitedPostState;

  factory VisitedPostState.fromJson(Map<String, dynamic> json) =>
      _$VisitedPostStateFromJson(json);
}
