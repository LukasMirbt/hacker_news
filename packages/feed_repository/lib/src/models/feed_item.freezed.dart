// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedItem {

 String get id; int get rank; String get title; String get url; String? get urlHost; String? get upvoteUrl; bool get hasBeenUpvoted; int? get score; Hnuser? get hnuser; DateTime get age; int? get commentCount;
/// Create a copy of FeedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedItemCopyWith<FeedItem> get copyWith => _$FeedItemCopyWithImpl<FeedItem>(this as FeedItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlHost, urlHost) || other.urlHost == urlHost)&&(identical(other.upvoteUrl, upvoteUrl) || other.upvoteUrl == upvoteUrl)&&(identical(other.hasBeenUpvoted, hasBeenUpvoted) || other.hasBeenUpvoted == hasBeenUpvoted)&&(identical(other.score, score) || other.score == score)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,rank,title,url,urlHost,upvoteUrl,hasBeenUpvoted,score,hnuser,age,commentCount);

@override
String toString() {
  return 'FeedItem(id: $id, rank: $rank, title: $title, url: $url, urlHost: $urlHost, upvoteUrl: $upvoteUrl, hasBeenUpvoted: $hasBeenUpvoted, score: $score, hnuser: $hnuser, age: $age, commentCount: $commentCount)';
}


}

/// @nodoc
abstract mixin class $FeedItemCopyWith<$Res>  {
  factory $FeedItemCopyWith(FeedItem value, $Res Function(FeedItem) _then) = _$FeedItemCopyWithImpl;
@useResult
$Res call({
 String id, int rank, String title, String url, String? urlHost, String? upvoteUrl, bool hasBeenUpvoted, int? score, Hnuser? hnuser, DateTime age, int? commentCount
});




}
/// @nodoc
class _$FeedItemCopyWithImpl<$Res>
    implements $FeedItemCopyWith<$Res> {
  _$FeedItemCopyWithImpl(this._self, this._then);

  final FeedItem _self;
  final $Res Function(FeedItem) _then;

/// Create a copy of FeedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rank = null,Object? title = null,Object? url = null,Object? urlHost = freezed,Object? upvoteUrl = freezed,Object? hasBeenUpvoted = null,Object? score = freezed,Object? hnuser = freezed,Object? age = null,Object? commentCount = freezed,}) {
  return _then(FeedItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlHost: freezed == urlHost ? _self.urlHost : urlHost // ignore: cast_nullable_to_non_nullable
as String?,upvoteUrl: freezed == upvoteUrl ? _self.upvoteUrl : upvoteUrl // ignore: cast_nullable_to_non_nullable
as String?,hasBeenUpvoted: null == hasBeenUpvoted ? _self.hasBeenUpvoted : hasBeenUpvoted // ignore: cast_nullable_to_non_nullable
as bool,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,hnuser: freezed == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser?,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,commentCount: freezed == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


// dart format on
