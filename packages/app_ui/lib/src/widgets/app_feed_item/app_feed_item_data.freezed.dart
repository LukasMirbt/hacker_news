// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_feed_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppFeedItemData {

 bool get visited; String get rank; String get title; String get age; String? get urlHost; String? get user; void Function() get onPressed; String? get score; String? get commentCount; bool get hasBeenUpvoted; void Function() get onVotePressed; void Function() get onCommentPressed; void Function() get onSharePressed; void Function() get onMorePressed;
/// Create a copy of AppFeedItemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppFeedItemDataCopyWith<AppFeedItemData> get copyWith => _$AppFeedItemDataCopyWithImpl<AppFeedItemData>(this as AppFeedItemData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppFeedItemData&&(identical(other.visited, visited) || other.visited == visited)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.title, title) || other.title == title)&&(identical(other.age, age) || other.age == age)&&(identical(other.urlHost, urlHost) || other.urlHost == urlHost)&&(identical(other.user, user) || other.user == user)&&(identical(other.onPressed, onPressed) || other.onPressed == onPressed)&&(identical(other.score, score) || other.score == score)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.hasBeenUpvoted, hasBeenUpvoted) || other.hasBeenUpvoted == hasBeenUpvoted)&&(identical(other.onVotePressed, onVotePressed) || other.onVotePressed == onVotePressed)&&(identical(other.onCommentPressed, onCommentPressed) || other.onCommentPressed == onCommentPressed)&&(identical(other.onSharePressed, onSharePressed) || other.onSharePressed == onSharePressed)&&(identical(other.onMorePressed, onMorePressed) || other.onMorePressed == onMorePressed));
}


@override
int get hashCode => Object.hash(runtimeType,visited,rank,title,age,urlHost,user,onPressed,score,commentCount,hasBeenUpvoted,onVotePressed,onCommentPressed,onSharePressed,onMorePressed);

@override
String toString() {
  return 'AppFeedItemData(visited: $visited, rank: $rank, title: $title, age: $age, urlHost: $urlHost, user: $user, onPressed: $onPressed, score: $score, commentCount: $commentCount, hasBeenUpvoted: $hasBeenUpvoted, onVotePressed: $onVotePressed, onCommentPressed: $onCommentPressed, onSharePressed: $onSharePressed, onMorePressed: $onMorePressed)';
}


}

/// @nodoc
abstract mixin class $AppFeedItemDataCopyWith<$Res>  {
  factory $AppFeedItemDataCopyWith(AppFeedItemData value, $Res Function(AppFeedItemData) _then) = _$AppFeedItemDataCopyWithImpl;
@useResult
$Res call({
 bool visited, String rank, String title, String age, String? urlHost, String? user, void Function() onPressed, String? score, String? commentCount, bool hasBeenUpvoted, void Function() onVotePressed, void Function() onCommentPressed, void Function() onSharePressed, void Function() onMorePressed
});




}
/// @nodoc
class _$AppFeedItemDataCopyWithImpl<$Res>
    implements $AppFeedItemDataCopyWith<$Res> {
  _$AppFeedItemDataCopyWithImpl(this._self, this._then);

  final AppFeedItemData _self;
  final $Res Function(AppFeedItemData) _then;

/// Create a copy of AppFeedItemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? visited = null,Object? rank = null,Object? title = null,Object? age = null,Object? urlHost = freezed,Object? user = freezed,Object? onPressed = null,Object? score = freezed,Object? commentCount = freezed,Object? hasBeenUpvoted = null,Object? onVotePressed = null,Object? onCommentPressed = null,Object? onSharePressed = null,Object? onMorePressed = null,}) {
  return _then(AppFeedItemData(
visited: null == visited ? _self.visited : visited // ignore: cast_nullable_to_non_nullable
as bool,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,urlHost: freezed == urlHost ? _self.urlHost : urlHost // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String?,onPressed: null == onPressed ? _self.onPressed : onPressed // ignore: cast_nullable_to_non_nullable
as void Function(),score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as String?,commentCount: freezed == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as String?,hasBeenUpvoted: null == hasBeenUpvoted ? _self.hasBeenUpvoted : hasBeenUpvoted // ignore: cast_nullable_to_non_nullable
as bool,onVotePressed: null == onVotePressed ? _self.onVotePressed : onVotePressed // ignore: cast_nullable_to_non_nullable
as void Function(),onCommentPressed: null == onCommentPressed ? _self.onCommentPressed : onCommentPressed // ignore: cast_nullable_to_non_nullable
as void Function(),onSharePressed: null == onSharePressed ? _self.onSharePressed : onSharePressed // ignore: cast_nullable_to_non_nullable
as void Function(),onMorePressed: null == onMorePressed ? _self.onMorePressed : onMorePressed // ignore: cast_nullable_to_non_nullable
as void Function(),
  ));
}

}


// dart format on
